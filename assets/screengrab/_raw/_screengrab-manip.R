## _screengrab-manip.R
##
## Usage: Rscript _screengrab-manip.R FILE1 FILE2 etc.

##Parameters
##YAML file where manipulation metadata is stored
manip_key <- "_manip-key.yml"
##Relative path for writing output files
out_dir <- ".."

##Packages
library(yaml)
library(purrr)
suppressPackageStartupMessages(library(dplyr))
suppressWarnings(suppressPackageStartupMessages(library(magick)))

##Check that all arguments are files defined in manip_key
to_manip <- commandArgs(trailingOnly = TRUE)
manipable <- 
  manip_key |>
  read_yaml() |>
  map(discard_at, "instructions") |>
  map_dfr(as_tibble)
unmanipable <- setdiff(to_manip, manipable$screengrab)
if (length(unmanipable) > 0) {
  stop("The following file(s) are not defined in ", manip_key, ": ", paste(unmanipable, collapse=" "))
}

##Transform and write
manipable |>
  filter(screengrab %in% to_manip) |>
  mutate(geometry = paste0(width, "x", height, "+", offset_x, "+", offset_y),
         in_image = map(screengrab, image_read),
         out_image = map2(in_image, geometry, image_crop)) |>
  with(walk2(out_image, file.path(out_dir, screengrab), image_write))
