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

##Wrangle YAML to tibble (with list-columns for overlay & drawing, if applicable)
manip <-
  yaml |>
  keep(~ .x$screengrab %in% to_manip) |>
  map_dfr(~ .x |>
            discard_at("instructions") |>
            modify_at(c("overlay", "drawing"), ~ list(map_dfr(.x, as_tibble))) |>
            as_tibble())

##Set up I/O paths
if ("in_path" %in% colnames(manip)) {
  manip <- manip |>
    mutate(in_path = coalesce(in_path, screengrab))
} else {
  manip <- manip |>
    mutate(in_path = screengrab)
}
if ("dir" %in% colnames(manip)) {
  manip <- manip |>
    mutate(out_path = file.path(coalesce(dir, out_dir), screengrab))
} else {
  manip <- manip |>
    mutate(out_path = file.path(out_dir, screengrab))
}
##Set up images
manip <- manip |>
  mutate(in_image = map(in_path, image_read),
         out_image = in_image)

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

##Optionally do additional drawing
if ("drawing" %in% colnames(manip)) {
  manip <- manip |>
    mutate(out_image = map2(out_image, drawing, \(img, draw) {
      if (is.null(draw)) {
        ##If no drawing, return out_image
        img
      } else {
        ##If drawing, create a graphics device and perform drawings in order
        img <- image_draw(img)
        draw |> 
          rowwise() |> 
          group_split() |> 
          walk(~ do.call(.x$func, .x[-1]))
        dev.off()
        img
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
