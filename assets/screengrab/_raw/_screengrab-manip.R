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
yaml <- read_yaml(manip_key)
manipable <- map_chr(yaml, "screengrab")
unmanipable <- setdiff(to_manip, manipable)
if (length(unmanipable) > 0) {
  stop("The following file(s) are not defined in ", manip_key, ": ", paste(unmanipable, collapse=" "))
}

##Wrangle YAML to tibble (with list-column for overlay, if applicable)
manip <-
  yaml |>
  keep(~ .x$screengrab %in% to_manip) |>
  map_dfr(~ .x |>
            discard_at("instructions") |>
            modify_at("overlay", ~ list(map_dfr(.x, as_tibble))) |>
            as_tibble()) |>
  ##Set up images & paths
  mutate(in_image = map(screengrab, image_read),
         out_image = in_image,
         out_path = file.path(out_dir, screengrab))

##Optionally overlay additional images
if ("overlay" %in% colnames(manip)) {
  manip <- manip |>
    mutate(out_image = map2(out_image, overlay, \(img, ov) {
      if (is.null(ov)) {
        ##If no overlay, return out_image
        img
      } else {
        ##If overlay, overlay images in order
        reduce2(.init=img, map(ov$image, image_read), 
                geometry_point(ov$offset_x, ov$offset_y),
                \(x, y, z) image_composite(x, y, offset=z))
      }}
    ))
}

##Crop
manip <- manip |>
  mutate(geometry = geometry_area(width, height, offset_x, offset_y), ##paste0(width, "x", height, "+", offset_x, "+", offset_y)
         .by=screengrab) |>
  mutate(out_image = map2(out_image, geometry, image_crop))

##Write
with(manip, 
     walk2(out_image, out_path, image_write))
