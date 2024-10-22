##
## sync-layers.R
## Dan Villarreal (d.vill@pitt.edu)
##
## Download layer definitions from APLS to create/update Markdown files for use
## in APLS documentation
##

##Parameters
##Directory for Markdown files
md_dir <- "."
##Whether or not to write/update Markdown files
write_new_files <- TRUE
update_existing_files <- TRUE


# Preliminaries -----------------------------------------------------------

##Ensure correct working directory
if (basename(getwd()) != "_layers") {
  stop("Please change working directory.")
}

##Packages
library(tidyverse)
library(nzilbb.labbcat)
library(yaml)

##Authenticate
lc <- "https://apls.pitt.edu/labbcat"
username <- "APLS_USERNAME"
pw <- "APLS_PASSWORD"
if (nchar(Sys.getenv(username))==0 || nchar(Sys.getenv(pw))==0) {
  stop("Please add APLS_USERNAME and APLS_PASSWORD variables to ~/.Renviron or PATH")
}
invisible(labbcatCredentials(lc, Sys.getenv(username), Sys.getenv(pw)))


# Download & shape layer data ---------------------------------------------

##Get layer data
layers <- getLayers(lc)

##Wrangle layer data
layers <- layers |>
  ##Make into a tibble
  as_tibble() |>
  ##NAs for blanks
  mutate(across(where(is.character), ~ na_if(.x, ""))) |>
  ##Nicer column names
  rename(short_description = description, project = category, parent = parentId, 
         data_type = type) |>
  ##Nicer column order
  relocate(id, short_description, layer_id, .before=1) |>
  relocate(extra, .after=last_col())

##Get relevant subset of layers/columns
transcript_layers <-
  layers |>
  ##Remove participant/transcript attributes
  filter(!str_detect(id, "^(participant|transcript)_")) |> 
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
         across(c(project, extra), ~ replace_na(.x, "(none)")),
         across(scope, ~ case_match(.x, 
                                    "W" ~ "word",
                                    "S" ~ "segment",
                                    "M" ~ "phrase",
                                    "F" ~ "span",
                                    NA ~ "non-transcript")),
         across(data_type, ~ case_match(.x, 
                                       "string" ~ "text",
                                       "ipa" ~ "phonological",
                                       "number" ~ "numeric")),
         across(alignment, ~ case_match(.x, 
                                        0 ~ "complete interval",
                                        1 ~ "timepoint(s)",
                                        2 ~ "sub-interval(s)")))

##Add attributes pertaining to how users can interact with layers
transcript_layers <- transcript_layers |>
  ##All layers can be exported from https://apls.pitt.edu/labbcat/transcripts
  ##  (though some appear in weird ways--or not at all--depending on the format)
  mutate(transcripts_exportable = TRUE,
         ##main_participant, turn, and utterance can't be exported from
         ##  https://apls.pitt.edu/labbcat/matches
         matches_exportable = !(id %in% c("main_participant", "turn", "utterance")),
         ##How layer can be used in https://apls.pitt.edu/labbcat/search
         searchable = case_when(
           ##Via filters
           layer_id < 0 ~ "filters",
           ##In search matrix, but only for anchoring matches
           id %in% c("turn","utterance") ~ "anchor-only",
           ##In search matrix
           TRUE ~ "search-matrix"),
         ##Whether layer can be selected/deselected in 
         ##  https://apls.pitt.edu/labbcat/transcript (FALSE means that it's
         ##  displayed through other means)
         viewable = !(id %in% c("comment", "noise")) & layer_id >= 0,
         .before=extra)


# Identify files to create/update -----------------------------------------

##Get existing Markdown files
md <- 
  dir(md_dir, "\\.md$", full.names=TRUE) |>
  str_subset("README\\.md", negate=TRUE) |>
  set_names(~ str_remove(basename(.x), "\\.md$")) |>
  map(read_lines)
##Extract YAML headers (lines between 1st & 2nd "---") as lists
yaml_bounds <- map(md, ~ str_which(.x, "^---$"))
yaml <- map2(md, yaml_bounds, 
             ~ .x[(.y[1]+1):(.y[2]-1)] |>
               yaml.load())
##Get "synced" attributes as a single dataframe
old_synced <-
  yaml |>
  map_dfr(~ .x |>
            pluck("synced") |>
            ##Make sure NULL attributes don't get removed
            map(~ replace(.x, is.null(.x), NA)),
          .id="id")

##Identify layers that need new files & layers that need updated files
to_create <- anti_join(transcript_layers, old_synced, "id")
to_update <- anti_join(old_synced, transcript_layers, colnames(old_synced)[-1])


# Create files for new layers ---------------------------------------------

##Add blank attributes (to be filled in manually for new layers)
blankAttr <- list(last_sync_modified_date = Sys.time() |>
                    format("%Y-%m-%dT%H:%M:%S%z"),
                  parallel = "Whether there are parallel tags per annotation (e.g., multiple possible phonemic representations)",
                  notation = list(primary = "Main category of notation system (e.g., English, downcased English, Penn Treebank tags, DISC); links to `doc/notation-systems`",
                                  additional = "_If applicable_, symbols that augment the primary notation system (e.g., transcription prosody symbols, morpheme marker, DISC syllabification/stress, foll_segment pause symbol). Delete if not applicable",
                                  missing = "How missing values should be interpreted"),
                  inputs = list(list(input = "Name of input",
                                     type = "`layer`, `dictionary`, `algorithm`, `transcription`, or `other`"),
                                list(input = "Name of input",
                                     type = "`layer`, `dictionary`, `algorithm`, `transcription`, or `other`")),
                  versions = list(first_appeared = "Where layer first appeared",
                                  last_modified = "Where layer was last modified"),
                  last_modified_date = "Handled by Git pre-commit hook")

##List of to-be-created YAML headers
to_create <- to_create |>
  ##Nest synced attributes w/in "synced" element
  nest(data = -id) |>
  pull(data, id) |>
  map(~ c(synced = list(.x),
          ##Add blank attributes
          blankAttr) |>
        ##As a list of YAML headers
        as.yaml(indent.mapping.sequence=TRUE))

##List of Markdown files to be created
to_create <- to_create |>
  map(~ c("---", paste0(.x, "---"), "",
          "**Fill longer description here**", "",
          "Any headings should be level-3", "", "",
          "{% include linklist.html %}"))

##Optionally write new Markdown files
if (write_new_files) {
  to_create |>
    iwalk(~ write_lines(.x, paste0(.y, ".md")))
}


# Update files for existing layers ----------------------------------------

