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
  make_option(c("--hsv", "-v"), action="store_true", default=FALSE, 
              metavar="HSV",
              help="use HSV rather than RGB for calculating distances"),
  make_option(c("--dont-scale-hsv", "-l"), action="store_true", default=FALSE,
              metavar="Don't scale HSV",
              help="if using hsv, calculate distance in native [0,1] rather than scaled to [0,255] for better comparability to RGB"),
  make_option(c("--decimal-places", "-d"), type="integer", default=3, 
              metavar="Decimal places",
              help="number of decimal places for distances (and hsv values if applicable)"),
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
##To replicate https://shallowsky.com/colormatch/index.php, set to (x11, TRUE, FALSE, FALSE, FALSE, 0, 1, NULL)
color_set <- opt$options$color_set
suffixed <- opt$options$suffixed
sgi <- opt$options$sgi
hsv <- opt$options$hsv
scale_hsv <- !opt$options$dont_scale_hsv
decimal_places <- opt$options$decimal_places
n <- opt$options$n
indiv_ref <- opt$options$ref_color
indiv_ref <- if (is.null(indiv_ref) || indiv_ref=="NULL") NULL else indiv_ref

##Color parsing functions
##Convert output of grDevices color functions to dataframe
frame_color <- function(x) {
  x |> 
    t() |>
    as.data.frame()
}
##Convert hex code to RGB
hex_to_rgb <- compose(frame_color, col2rgb)
##Convert RGB dataframe to HSV
rgb_to_hsv <- function(x) {
  x |>
    select(red, green, blue) |>
    rename_with(\(x) substr(x, 1, 1)) |>
    do.call(rgb2hsv, args=_) |>
    frame_color()
}
##Add HSV columns to a dataframe with RGB columns
add_hsv <- function(x) {
  if (any(c("h","s","v") %in% colnames(x))) {
    x <- x |>
      select(-any_of(c("h","s","v")))
  }
  x |>
    nest(rgb = red:blue) |>
    mutate(hsv = map(rgb, rgb_to_hsv)) |>
    unnest(c(rgb, hsv))
}
##Check that string is a valid color and convert to dataframe
color_to_dataframe <- function(x, ref_colors) {
  ##Hex code (hashtag optional) or R,G,B triple
  if (missing(ref_colors)) {
    if (grepl("^#?[0-9A-Fa-f]{6}$", x)) {
      if (nchar(x)==6) {
        x <- paste0("#", x)
      }
      color <- hex_to_rgb(x)
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
  ##Either remove SGI colors or separator lines
  if (!sgi) {
    ref_colors <- ref_colors |>
      slice(1:(which(ref_colors$hex=="")-1))
  } else {
    ref_colors <- ref_colors |>
      filter(!hex %in% c("", "standard")) |>
      mutate(across(color, \(x) sub("^sgi", "SGI", x)))
  }
} else if (color_set=="xkcd") {
	ref_colors <- suppressWarnings(read_tsv("https://xkcd.com/color/rgb.txt",
                                 col_names=c("color","hex"), col_types="cc-",
                                 skip=1))
} else {
  stop("color-set '", color_set, "' not supported (only x11, xkcd)")
}
##Turn hex into red, green, blue
ref_colors <- ref_colors |>
	mutate(rgb = map(hex, hex_to_rgb)) |>
  unnest_wider(rgb)

##Compare input color to reference colors
if (hsv) {
  compare_colors <-
    ref_colors |>
    add_hsv() |>
    rename_with(\(x) paste0(x, "_ref"), h:v) |>
    add_column(color |>
                 rgb_to_hsv() |>
                 rename_with(\(x) paste0(x, "_input"))) |>
    pivot_longer(-c(color:blue), names_to=c("component",".value"),
                 names_pattern="(.+)_(.+)")
} else {
  compare_colors <-
    ref_colors |>
    rename_with(\(x) paste0(x, "_ref"), red:blue) |>
    add_column(color |>
                 rename_with(\(x) paste0(x, "_input"), red:blue)) |>
    pivot_longer(-c(color, hex), names_to=c("component",".value"),
                 names_pattern="(.+)_(.+)")
}
compare_colors <- compare_colors |>
  mutate(Euclidean_dist = sqrt(sum((ref - input)^2)), .by=color) |>
  select(-input) |> 
  pivot_wider(names_from=component, values_from=ref) |>
  relocate(Euclidean_dist, .after=color) |>
  arrange(Euclidean_dist)
if (hsv && scale_hsv) {
  compare_colors <- compare_colors |>
    mutate(across(Euclidean_dist, \(x) x*255))
}

##Add original color as header row
compare_colors <- compare_colors |>
  add_row(!!!color,
          hex=tolower(do.call(rgb, color/255)),
          color="(Input)",
          .before=1)
if (hsv) {
  ##HSV for header row
  compare_colors <- compare_colors |>
    add_hsv()
}

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

##Round decimals
compare_subset <- compare_subset |>
  mutate(across(where(is.double), \(x) round(x, decimal_places)))

##Output
compare_subset
