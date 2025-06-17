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
              help="number of matching colors to print")
)
opt_parser <- OptionParser("usage: %prog [options] color", option_list,
                           description="  Find closest names for hex code or R,G,B triple")
opt <- parse_args(opt_parser, positional_arguments=1, convert_hyphens_to_underscores=TRUE)
##Color (positional argument)
color <- opt$args
##Optional arguments
##To replicate https://shallowsky.com/colormatch/index.php, set to (x11, TRUE, FALSE, 1)
color_set <- opt$options$color_set
suffixed <- opt$options$suffixed
sgi <- opt$options$sgi
n <- opt$options$n

##Parse color from hex code or RGB triple
hex2rgb <- function(x) {
  x |>
    col2rgb() |>
    t() |>
    as.data.frame()
}
if (grepl("^#?[0-9A-Fa-f]{6}$", color)) {
  if (nchar(color)==6) {
    color <- paste0("#", color)
  }
  color <- hex2rgb(color)
} else if (grepl("^\\d{1,3},\\d{1,3},\\d{1,3}$", color)) {
  color <-
    tibble(rgb = color) |>
    separate_wider_delim(rgb, ",", names=c("red","green","blue")) |>
    mutate(across(everything(), as.integer)) |>
    filter(if_all(everything(), \(x) between(x, 0, 255)))
  if (nrow(color) == 0) {
    stop("RGB colors must be between 0 and 255")
  }
} else {
  stop("Color must be a 6-digit hex code or a red,green,blue triple")
}

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

##Output
compare_colors |>
  slice(1:(n+1)) |>
  as.data.frame()
