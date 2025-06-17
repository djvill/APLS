##_closest-colors.R

library(optparse)
library(readr)
suppressPackageStartupMessages(library(dplyr))
library(purrr)
library(tidyr)
suppressPackageStartupMessages(library(rvest))
library(tibble)

##Parse command-line options
params <- commandArgs(trailingOnly=TRUE)
option_list=list(
  make_option(c("--color-set", "-s"), type="character", default="x11", 
              metavar="Color set",
              help="color set (x11 or xkcd)"),
  make_option(c("--suffixed", "-x"), action="store_true", default=FALSE, 
              metavar="Suffixed",
              help="if x11, include suffixed colors (e.g., green1, gray20)"),
  make_option(c("--sgi", "-g"), action="store_true", default=FALSE, 
              metavar="SGI",
              help="if x11, include SGI colors"),
  make_option(c("--num-colors", "-n"), type="integer", default=10, 
              metavar="Rows", 
              help="number of matching colors to print"),
  make_option(c("--ref-color", "-f"), type="character", default="NULL", 
              metavar="color", 
              help="color to include in the matching colors (e.g., #FFB81C, hot pink), even if it's not in the top n")
)
opt_parser <- OptionParser("usage: %prog [options] color", option_list,
                           description="  Find closest names for hex code or R,G,B triple")
opt <- parse_args(opt_parser, positional_arguments=1, convert_hyphens_to_underscores=TRUE)
##Color (positional argument)
color <- opt$args
##Optional arguments
##To replicate https://shallowsky.com/colormatch/index.php, set to (x11, TRUE, FALSE, 1, NULL)
color_set <- opt$options$color_set
suffixed <- opt$options$suffixed
sgi <- opt$options$sgi
n <- opt$options$n
indiv_ref <- opt$options$ref_color
indiv_ref <- if (is.null(indiv_ref) || indiv_ref=="NULL") NULL else indiv_ref

##Color parsing functions
##Parse color from hex code or RGB triple
hex2rgb <- function(x) {
  x |>
    col2rgb() |>
    t() |>
    as.data.frame()
}
##Check that string is a valid color and convert to dataframe
color_to_dataframe <- function(x, ref_colors) {
  ##Hex code (hashtag optional) or R,G,B triple
  if (missing(ref_colors)) {
    if (grepl("^#?[0-9A-Fa-f]{6}$", x)) {
      if (nchar(x)==6) {
        x <- paste0("#", x)
      }
      color <- hex2rgb(x)
    } else if (grepl("^\\d{1,3},\\d{1,3},\\d{1,3}$", x)) {
      color <-
        tibble(rgb = x) |>
        separate_wider_delim(rgb, ",", names=c("red","green","blue")) |>
        mutate(across(everything(), as.integer)) |>
        filter(if_all(everything(), \(x) between(x, 0, 255)))
      if (nrow(color) == 0) {
        stop("RGB colors must be between 0 and 255")
      }
    } else {
      stop("Color must be a 6-digit hex code or a red,green,blue triple")
    }
  } else {
    if (!"color" %in% colnames(ref_colors)) {
      stop("ref_colors is missing a color column")
    }
    if (!x %in% ref_colors$color) {
      stop("color is not in ref_colors")
    }
    color <-
      ref_colors |>
      filter(color==x) |>
      select(red, green, blue)
  }
  color
}

##Parse input color
color <- color_to_dataframe(color)

##Get dataframe of reference colors
if (color_set=="x11") {
  ref_colors <- read_html("https://www.astrouw.edu.pl/~jskowron/colors-x11/rgb.html") |>
    html_element("table") |>
    html_table() |>
    select(color = X1, hex = X2)
  ##Optionally remove number-suffixed colors (e.g., green1, gray20)
  if (!suffixed) {
    ref_colors <- ref_colors |> 
      filter(!grepl("\\d+", color))
  }
  ##Remove duplicate names (e.g., light yellow vs. LightYellow)
  ref_colors <- ref_colors |>
    slice(1, .by=hex)
  ##Optionally remove SGI colors
  if (!sgi) {
    ref_colors <- ref_colors |>
      slice(1:(which(ref_colors$hex=="")-1))
  }
} else if (color_set=="xkcd") {
	ref_colors <- suppressWarnings(read_tsv("https://xkcd.com/color/rgb.txt",
                                 col_names=c("color","hex"), col_types="cc-",
                                 skip=1))
}
##Turn hex into red, green, blue
ref_colors <- ref_colors |>
	mutate(rgb = map(hex, hex2rgb)) |>
  unnest_wider(rgb)

##Compare input color to reference colors
compare_colors <-
  ref_colors |>
  rename_with(\(x) paste0(x, "_ref"), red:blue) |>
  add_column(color |>
               rename_with(\(x) paste0(x, "_input"), red:blue)) |>
  pivot_longer(-c(color,hex), names_to=c("component",".value"),
               names_pattern="(.+)_(.+)") |>
  mutate(Euclidean_dist = sqrt(sum((ref - input)^2)), .by=color) |>
  select(-input) |> 
  pivot_wider(names_from=component, values_from=ref) |>
  relocate(Euclidean_dist, .after=color) |>
  arrange(Euclidean_dist)

##Add original color as header row
compare_colors <- compare_colors |>
  add_row(!!!color,
          hex=tolower(do.call(rgb, color/255)),
          color="(Input)",
          .before=1)

##Get comparison subset
compare_subset <-
  compare_colors |>
  slice(1:(n+1))

##Change row names; optionally add specific reference color
if (!is.null(indiv_ref)) {
  ##Get full ref_colors row for indiv_ref
  tryCatch(indiv_df <- color_to_dataframe(indiv_ref, ref_colors),
           ##More informative user-facing error
           error = function(e) {
             if (e$message=="color is not in ref_colors") {
               stop("ref-color '", indiv_ref, "' is not defined in the ", color_set, " color set")
             } else {
               stop(e)
             }
           })
  indiv_df <- color_to_dataframe(indiv_ref, ref_colors) |>
    semi_join(compare_colors, y=_, c("red","green","blue"))
  compare_subset <- compare_subset |>
    union(indiv_df) |>
    as.data.frame()
  if (nrow(compare_subset)==n+2) {
    indiv_row <- which(compare_colors$color==indiv_ref)
    rownames(compare_subset) <- c("", 1:n, indiv_row)
  } else {
    rownames(compare_subset) <- c("", 1:n)
  }
} else {
  compare_subset <- as.data.frame(compare_subset)
  rownames(compare_subset) <- c("", 1:n)
}

##Output
compare_subset
