##
## sync-layers.R
## Dan Villarreal (d.vill@pitt.edu)
##
## Download layer definitions from APLS to create/update Markdown files for use
## in APLS documentation
##

library(tidyverse)
library(nzilbb.labbcat)
library(yaml)

##Parameters: Template for YAML headers, whether or not to write/update Markdown
##  files
template_header <- TRUE
write_files <- TRUE

##Authenticate
lc <- "https://apls.pitt.edu/labbcat"
username <- "APLS_USERNAME"
pw <- "APLS_PASSWORD"
if (nchar(Sys.getenv(username))==0 || nchar(Sys.getenv(pw))==0) {
  stop("Please add APLS_USERNAME and APLS_PASSWORD variables to ~/.Renviron or PATH")
}
invisible(labbcatCredentials(lc, Sys.getenv(username), Sys.getenv(pw)))

##Get layer data
layers <- getLayers(lc)

##Wrangle layer data
layers <- layers |>
  ##Make into a tibble
  as_tibble() |>
  ##NAs for blanks
  mutate(across(where(is.character), ~ na_if(.x, ""))) |>
  ##Nicer column names
  rename(layer = id, short_description = description, project = category, 
         parent = parentId, data_type = type) |>
  ##Nicer column order
  relocate(layer, short_description, layer_id, .before=1) |>
  relocate(extra, .after=last_col())

##Get relevant subset of layers/columns
transcript_layers <-
  layers |>
  ##Remove participant/transcript attributes
  filter(!str_detect(layer, "^(participant|transcript)_")) |> 
  ##Remove columns
  select(-c(
    ##Relevant only to participant/transcript attributes
    style, layer_manager_id, class_id, attribute, hint, display_order, 
    searchable, access, label, notes,
    ##List-columns
    validLabels, validLabelsDefinition,
    ##Graph-algebraic columns (see https://doi.org/10.1016/j.csl.2017.01.004)
    parentIncludes, peers, peersOverlap, saturated,
    ##enabled is often subject to change
    enabled,
    ##I can't figure out what subtype does
    subtype))


##Translate columns to more readable format
transcript_layers <- transcript_layers |>
  ##For now, only keep the first line of description as short_description
  mutate(across(short_description, ~ str_remove(.x, regex("\n.+", dotall=TRUE))),
         across(project, ~ replace_na(.x, "(none)")),
         across(scope, ~ case_match(.x, 
                                    "W" ~ "word",
                                    "S" ~ "segment",
                                    "M" ~ "phrase",
                                    "F" ~ "span")),
         across(data_type, ~ case_match(.x, 
                                       "string" ~ "text",
                                       "ipa" ~ "phonological",
                                       "number" ~ "numeric")),
         across(alignment, ~ case_match(.x, 
                                        0 ~ "complete interval",
                                        1 ~ "timepoint(s)",
                                        2 ~ "sub-interval(s)")))

##Something something
transcript_layers |>
  transpose() |>
  map(as.yaml)


