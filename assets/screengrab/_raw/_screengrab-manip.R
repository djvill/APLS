## _screengrab-manip.R
##
## Usage: Rscript _screengrab-manip.R FILE1 FILE2 etc.
## To regenerate all screengrabs (ignoring directly-saved ones):
## grep -oP '(?<=screengrab: )[^!]+' _manip-key.yml | xargs Rscript _screengrab-manip.R
## To regenerate screengrabs in a directory:
## grep -oP '(?<=screengrab: )search/.+' _manip-key.yml | xargs Rscript _screengrab-manip.R

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
library(tidyr)

##Check that all arguments are files defined in manip_key
to_manip <- sub("^\\.\\./", "", commandArgs(trailingOnly = TRUE))
yaml <- read_yaml(manip_key)
screengrabs <- yaml$screengrabs
manipable <- map_chr(screengrabs, "screengrab")
unmanipable <- setdiff(to_manip, manipable)
if (length(unmanipable) > 0) {
  stop("The following file(s) are not defined in ", manip_key, ": ", paste(unmanipable, collapse=" "))
}

##Function for interpreting constant expressions in vectors
interp_const <- function(x, expect_num=TRUE, envir=yaml$constants) {
  ##Bypass interpretation if numeric is expected and already found
  if (expect_num) {
    ##Continue if as.numeric(x) throws "Warning: NAs introduced by coercion"
    tryCatch(warning = \(e) e, return(as.numeric(x)))
  }
  
  ##Attempt to evaluate expressions
  evald <-
    x |>
    map(safely(\(x) eval(str2expression(x), envir=envir))) |>
    map("result")
  
  ##Handle expressions that didn't evaluate
  if (expect_num) {
    ##Expect numeric: throw error
    errs <- 
      evald |> 
      set_names(x) |>
      keep(is.null)
    if (length(errs) > 0) {
      stop("Constants not found in envir: ",
           paste(names(errs), collapse=" "))
    }
  } else {
    ##Don't expect numeric: use original value instead
    evald <- evald |>
      map2(x, \(x, y) ifelse(is.null(x), y, x))
  }
  
  ##If applicable, check if coercible to numeric
  if (expect_num) {
    evald <- tryCatch(error = \(e) stop("At least one constant is non-numeric"),
                      list_simplify(evald, ptype=numeric()))
  } else {
    evald <- list_simplify(evald, ptype=character())
  }
  
  evald
}

##Function for converting YAML (with interpretable constants) to tibble row
yaml_to_tibble <- function(x, envir=yaml$constants) {
  if (is.null(x)) return(x)
  x |>
    ##Interpret constants in numeric fields
    map_at(c("offset_x", "offset_y", "width", "height",
             "xleft", "ytop", "xright", "ybottom", "lwd"), interp_const) |>
    ##Interpret constants in character fields
    map_at("border", \(x) interp_const(x, expect_num=FALSE)) |>
    as_tibble()
}

##Wrangle YAML to tibble:
##- DF-columns for overlay & drawing, if applicable
##- List-columns for combine & buffer, if applicable
##- composite column (even combine is not in the input, to make things simpler)
manip <-
  screengrabs |>
  keep(~ .x$screengrab %in% to_manip) |>
  map_dfr(~ .x |>
            discard_at("instructions") |>
            modify_at(c("overlay", "drawing"), \(x) list(map_dfr(x, yaml_to_tibble))) |>
            modify_at(c("combine", "buffer"), list) |>
            yaml_to_tibble())
if ("combine" %in% colnames(manip)) {
  manip <- manip |>
    mutate(composite = !map_lgl(combine, is.null))
} else {
  manip <- manip |>
    mutate(composite = FALSE)
}

##Set up I/O paths
if ("combine" %in% colnames(manip)) {
  manip <- manip |>
    mutate(across(combine, \(x) if_else(composite,
                                        map(x, \(x) file.path(out_dir, x)),
                                        NA)))
  if ("in_path" %in% colnames(manip)) {
    manip <- manip |>
      mutate(in_path = in_path |>
               map2(combine, coalesce) |>
               map2(screengrab, coalesce))
  } else {
    manip <- manip |>
      mutate(in_path = map2(combine, screengrab, coalesce))
  }
} else {
if ("in_path" %in% colnames(manip)) {
  manip <- manip |>
    mutate(in_path = coalesce(in_path, screengrab))
} else {
  manip <- manip |>
    mutate(in_path = screengrab)
}
}
if ("dir" %in% colnames(manip)) {
  manip <- manip |>
    mutate(out_path = file.path(coalesce(dir, out_dir), screengrab))
} else {
  manip <- manip |>
    mutate(out_path = file.path(out_dir, screengrab))
}

##Read inputs if possible
if ("combine" %in% colnames(manip)) {
  manip <- manip |>
    mutate(safe_image = map_depth(in_path, 2, safely(image_read), .ragged=TRUE),
           path_err = map_depth(safe_image, 2, "error"),
           in_image = map_depth(safe_image, 2, "result") |>
             map_if(!composite, 1),
           out_image = in_image)
  path_err <-
    manip |>
    unnest(c(path_err, in_path)) |>
    pull(path_err, in_path) |>
    compact()
} else {
manip <- manip |>
  mutate(safe_image = map(in_path, safely(image_read)),
         path_err = map(safe_image, "error"),
         in_image = map(safe_image, "result"),
         out_image = in_image)
path_err <-
  manip |>
  pull(path_err, in_path) |>
  compact()
}
##Throw errors if needed
if (length(path_err) > 0) {
  stop("Input image(s) not found: ",
       paste(names(path_err), collapse=" "))
}
##Create directory(ies) if needed
manip$out_path |>
  dirname() |>
  strsplit("/") |>
  walk(\(x) x |>
         accumulate(\(x, y) paste0(x, "/", y)) |>
         discard(dir.exists) |>
         walk(dir.create))

##Optionally create composites
if ("combine" %in% colnames(manip)) {
  to_combine <-
    manip |>
    filter(composite)
  if ("buffer" %in% colnames(to_combine)) {
    ##Create buffer
    to_combine <- to_combine |>
      unnest_wider(buffer) |>
      mutate(stack = orientation == "vertical",
             size = coalesce(size, 0),
             max_dims = map(in_image,
                            \(x) x |>
                              image_join() |>
                              image_info() |>
                              summarise(across(c(width, height), max))),
             buffer_width = if_else(stack,
                                    map_int(max_dims, "width"),
                                    size),
             buffer_height = if_else(stack,
                                     size,
                                     map_int(max_dims, "height")))
    if ("background_color" %in% colnames(to_combine)) {
      to_combine <- to_combine |>
        mutate(background_color = coalesce(background_color, "none"))
    } else {
      to_combine <- to_combine |>
        mutate(background_color = "none")
    }
    to_combine <- to_combine |>
      rename(buffer_color = background_color) |>
      pack(buffer = starts_with("buffer_"), .names_sep="_") |>
      mutate(buffer_image = pmap(buffer, image_blank))
    
    ##Combine images with buffer
    to_combine <- to_combine |>
      mutate(out_image = map2(in_image, buffer_image,
                              \(x, y) reduce(x,
                                             \(xx, yy) image_join(xx, y, yy))) |>
                           map2(stack, \(x, y) image_append(x, stack=y)))
  } else {
    to_combine <- to_combine |>
      mutate(out_image = map(in_image,
                              \(x) reduce(x,
                                          \(xx, yy) image_join(xx, yy))) |>
                           map2(stack, \(x, y) image_append(x, stack=y)))
  }
  ##Add back to main dataframe
  manip <- manip |>
    rows_update(to_combine |> select(screengrab, out_image), "screengrab")
}

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

##Crop and write
if (any(c("width", "height", "offset_x", "offset_y") %in% colnames(manip))) {
  ##Crop
  cropped <- 
    manip |>
    filter(if_all(c(width, height, offset_x, offset_y), ~ !is.na(.x))) |>
    mutate(geometry = geometry_area(width, height, offset_x, offset_y), ##paste0(width, "x", height, "+", offset_x, "+", offset_y)
           .by=screengrab) |>
    mutate(out_image = map2(out_image, geometry, image_crop))
  uncropped <- manip |>
    filter(if_all(c(width, height, offset_x, offset_y), is.na))
  
  ##Write
  with(cropped, 
       walk2(out_image, out_path, image_write))
  with(uncropped, 
       walk2(out_image, out_path, image_write))
} else {
  ##Nothing to crop
  with(manip, 
       walk2(out_image, out_path, image_write))
}
