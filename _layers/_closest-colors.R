##_closest-colors.R

library(readr)
suppressPackageStartupMessages(library(dplyr))
library(purrr)
library(tidyr)
suppressPackageStartupMessages(library(rvest))
library(tibble)

##Parameters (hard-coded for now, to be turned into command-line options later)
# color <- .....
colorDF <- data.frame(red = 211, green = 172, blue = 251) ##APLS segment layer color
color_set <- "x11" ##To compare to https://shallowsky.com/colormatch/index.php, set to x11
no_suffixed <- FALSE ##To compare to https://shallowsky.com/colormatch/index.php, set to FALSE
##Output colors
n <- 10

##Turn input color into dataframe of red, green, blue
# colorDF <- something(color)

##Get dataframe of reference colors
if (color_set=="x11") {
  ref_colors <- read_html("https://www.astrouw.edu.pl/~jskowron/colors-x11/rgb.html") |>
    html_element("table") |>
    html_table() |>
    select(color = X1, hex = X2)
  
  ##Optionally remove number-suffixed colors (e.g., green1, gray20)
  if (no_suffixed) {
    ref_colors <- ref_colors |> 
      filter(!grepl("\\d+", color))
  }
  
  ##Remove duplicate names (e.g., light yellow vs. LightYellow)
  ref_colors <- ref_colors |>
    slice(1, .by=hex)
  ##Only standard colors
  ref_colors <- ref_colors |>
    slice(1:(which(ref_colors$hex=="")-1))
} else if (color_set=="xkcd") {
	ref_colors <- read_tsv("https://xkcd.com/color/rgb.txt",
                         col_names=c("color","hex"), col_types="cc-",
                         skip=1) ##Ignore warning
}
##Turn hex into red, green, blue
ref_colors <- ref_colors |>
	mutate(rgb = map(hex, 
                     \(x) x |>
                       col2rgb() |>
                       t() |>
                       as.data.frame())) |>
  unnest_wider(rgb)

##Compare input color to reference colors
compare_colors <-
  ref_colors |>
  rename_with(\(x) paste0(x, "_ref"), red:blue) |>
  add_column(colorDF |>
               rename_with(\(x) paste0(x, "_input"), red:blue)) |>
  pivot_longer(-c(color,hex), names_to=c("component",".value"),
               names_pattern="(.+)_(.+)") |>
  mutate(Euclidean_dist = sqrt(sum((ref - input)^2)), .by=color) |>
  select(-input) |> 
  pivot_wider(names_from=component, values_from=ref) |>
  relocate(Euclidean_dist, .after=color) |>
  arrange(Euclidean_dist)

##Output
compare_colors |>
  slice(1:n) |>
  print(n=Inf)
