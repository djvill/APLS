##
## sync-layers.R
## Dan Villarreal (d.vill@pitt.edu)
##
## Download layer/attribute definitions from APLS to create/update Markdown
## files for use in APLS documentation, and inject JavaScript code that allows
## for layer/attribute descriptions in tooltips
##

##Parameters
##Directories for Markdown files
md_dir_layers <- "."
md_dir_attrib <- "../_attributes"

##Whether or not to write/update Markdown files
write_new_md_layers <- TRUE
update_existing_md_layers <- TRUE
write_new_md_attrib <- TRUE
update_existing_md_attrib <- TRUE

##Path to JavaScript file
js_path <- "../assets/js/keyterm-layer-links.js"

##Whether or not to write/update JavaScript file
update_existing_js_file <- TRUE

##Path to file for writing session info (NULL to skip)
session_info <- "_session-info_sync-layers.txt"

##Whether to show turn/word/segment as 'complete interval' alignment
##  See https://github.com/djvill/labbcat-server/commit/2af6f41
spoof_alignment <- TRUE

# Preliminaries -----------------------------------------------------------

##Ensure correct working directory
if (basename(getwd()) != "_layers") {
  stop("Please change working directory.")
}

##Packages
suppressPackageStartupMessages(library(tidyverse))
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


# Get layer & attribute data ------------------------------------------------

## Download & categorize layer data =========================================

##Get data on all "layers" (which include transcript/participant attributes)
lc_layers <- getLayers(lc)

##Columns and names
all_layers <- 
  lc_layers |>
  ##Make into a tibble
  as_tibble() |>
  ##Nicer column name
  rename(parent = parentId) |>
  ##Nicer column order
  relocate(id, layer_id, attribute, description, .before=1) |>
  relocate(extra, .after=last_col()) |>
  ##Remove columns
  select(-c(
    ##Redundant or uninformative
    class_id, label, notes,
    ##Graph-algebraic columns (see https://doi.org/10.1016/j.csl.2017.01.004 )
    parentIncludes, saturated,
    ##Not needed right now
    validLabelsDefinition, ##TMI for YAMLs
    style, ##Only pertains to attribute display
    enabled ##enabled is often subject to change
  ))

##Translate columns to more readable format
all_layers <- all_layers |>
  ##NAs for blanks
  mutate(across(where(is.character), ~ na_if(.x, "")),
         ##Categorize attributes
         attrib_type = case_when(
           id %in% c("corpus", "episode", "transcript") ~ "transcript",
           startsWith(id, "transcript_") ~ "transcript",
           id == "participant" ~ "participant",
           startsWith(id, "participant_") ~ "participant",
           ##main_participant is hard to categorize for user-facing purposes
           id == "main_participant" ~ "main_participant",
           .default=NA))

##Separate layers from attributes
attrib <-
  all_layers |>
  filter(!is.na(attrib_type))
layers <-
  all_layers |>
  filter(is.na(attrib_type))


## Wrangle layers ============================================================

##Columns and names
layers <- layers |>
  ##Remove columns relevant only to participant/transcript attributes
  select(-c(attribute, validLabels, subtype, hint, display_order, searchable, 
            access, attrib_type)) |>
  ##Rename
  rename(project = category,
         short_description = description, 
         vertical_peers = peersOverlap,
         data_type = type,
         layer_manager = layer_manager_id)

##Translate columns to more readable format
layers <- layers |>
  ##For now, only keep the first line of description as short_description
  mutate(across(short_description, ~ str_remove(.x, regex("\n.+", dotall=TRUE))),
         across(c(project, layer_manager, extra), ~ replace_na(.x, "(none)")),
         across(scope, ~ case_match(.x, 
                                    "W" ~ "word",
                                    "S" ~ "segment",
                                    "M" ~ "phrase",
                                    "F" ~ "span")),
         across(data_type, ~ case_when(
           id %in% c("turn","utterance") ~ "timing-only",
           data_type=="ipa" ~ "phonological",
           data_type=="number" ~ "numeric",
           data_type=="string" ~ "text")),
         across(alignment, ~ case_when(
           ##Same story for phrase layers---LaBB-CAT uses the sub-intervals
           ##  icon; for exporting matches to CSV, it treats phrase layers as
           ##  though they can't have horizontal peers (and actually, ditto for
           ##  the hidden scopes 'C' for corpus, 'E' for episode, 'G' for
           ##  participant/main_participant/transcript, though they never show
           ##  up with layer icons)
           # scope=="span" ~ "complete interval",
           
           ##Straightforward translations
           .x==0 ~ "complete interval",
           .x==1 ~ "timepoint",
           .x==2 ~ "sub-interval")),
         ##Recode shorter layer_manager values
         across(layer_manager, ~ case_match(.x,
                                            "CELEX-EN" ~ "CELEX-English",
                                            "py" ~ "Python",
                                            .default=.x)))

##Add properties pertaining to how users can interact with layers
layers <- layers |>
  ##All layers can be exported from https://apls.pitt.edu/labbcat/transcripts
  ##  (though some appear in weird ways--or not at all--depending on the format)
  mutate(transcripts_exportable = TRUE,
         
         ##turn and utterance can't be exported from
         ##  https://apls.pitt.edu/labbcat/matches
         matches_exportable = !(id %in% c("turn", "utterance")),
         
         ##How layer can be used in https://apls.pitt.edu/labbcat/search
         searchable = case_match(data_type,
                                 ##In search matrix, but only for anchoring matches
                                 "timing-only" ~ "anchor-only",
                                 ##In search matrix with a minimum & maximum
                                 "numeric" ~ "min_max",
                                 ##In search matrix with a regex
                                 c("phonological", "text") ~ "regex"),
         
         ##Whether layer can be the target of a search (https://github.com/nzilbb/labbcat-server/blob/b70d69/user-interface/src/main/angular/projects/labbcat-view/src/app/search-matrix/search-matrix.component.ts#L187-L194)
         search_targetable = case_when(
           id=="orthography" ~ "word",
           scope=="segment" ~ "segment",
           id %in% c("turn","utterance") ~ "no",
           alignment != "complete interval" ~ scope,
           .default="no"),
         
         ##Whether layer can be selected/deselected in 
         ##  https://apls.pitt.edu/labbcat/transcript (FALSE means that it's
         ##  displayed through other means)
         transcript_selectable = !(id %in% c("comment", "noise")),
         
         ##Do count boxes show up in matches > CSV Export?
         ##  https://github.com/nzilbb/labbcat-server/blob/9ee4cb3/user-interface/src/main/angular/projects/labbcat-common/src/lib/layer-checkboxes/layer-checkboxes.component.html#L187-L190
         export_includeCounts = case_when(
           !matches_exportable ~ NA, ##Not shown in matches > CSV Export
           id=="word" ~ FALSE,
           peers ~ TRUE,
           .default=FALSE),
         
         ##Do "anchor" symbols show up in matches > CSV Export?
         ##  https://github.com/nzilbb/labbcat-server/blob/9ee4cb3/user-interface/src/main/angular/projects/labbcat-common/src/lib/layer-checkboxes/layer-checkboxes.component.ts#L162-L169
         export_includeAnchorSharing = case_when(
           !matches_exportable ~ NA, ##Not shown in matches > CSV Export
           id=="word" ~ FALSE,
           scope=="span" ~ FALSE,
           alignment != "sub-interval" ~ FALSE,
           peers ~ TRUE,
           .default=FALSE),
         .before=extra)

##Optionally spoof alignments for turn/word/segment
if (spoof_alignment) {
  layers <- layers |>
    mutate(across(alignment, ~ if_else(id %in% c("turn","word","segment"), 
                                       "complete interval",
                                       alignment)))
}

## Wrangle attributes ======================================================

##Columns and names
attrib <- attrib |>
  ##Remove columns relevant only to transcript layers
  select(-c(alignment, category, peersOverlap, type, scope, layer_manager_id, extra)) |>
  ##Rename
  rename(display_title = description,
         multi_select = peers,
         valid_labels = validLabels,
         data_type = subtype,
         short_description = hint,
         filterable = searchable)

##Translate columns to more readable format
attrib <- attrib |>
  mutate(across(attribute, ~ if_else(is.na(.x), str_remove(id, "transcript_"), .x)),
         across(multi_select, ~ if_else(id=="participant", FALSE, .x)),
         across(valid_labels, ~ .x |>
                  as.list() |>
                  list_transpose() |>
                  map(~ .x |>
                        discard(is.na) |>
                        enframe("label", "description") |>
                        arrange(tolower(label)) |>
                        mutate(across(description, 
                                      ~ str_replace_all(.x, c("\\[" = "\\(",
                                                              "\\]" = "\\)")))) |>
                        ##Each element is a list of one-row tibbles (yields
                        ##  nicer YAML)
                        rowwise() |>
                        group_map(~ .x)) |>
                  ##Remove attributes from empty lists (for comparison to old
                  ##  synced attributes)
                  map_if(~ length(.x)==0, ~ list())),
         across(data_type, ~ case_when(attribute == "corpus" ~ "select",
                                       data_type == "R" ~ "text",
                                       data_type == "string" ~ "text",
                                       is.na(data_type) ~ "select",
                                       TRUE ~ data_type)),
         across(access, ~ .x |>
                  as.numeric() |>
                  as.logical() |>
                  replace_na(TRUE)))

##Manually set corpus label (can't be set upstream in LaBB-CAT or SQL)
attrib$valid_labels[[1]][[1]]$description <- "Sociolinguistic interviews conducted between 2003 and 2007 in four Pittsburgh-area neighborhoods: Cranberry Township, Forest Hills, the Hill District, and Lawrenceville"
##Manually set short descriptions for quasi-layers
short_desc_attrib <- tribble(
  ~id,  ~short_description,
  "corpus", "Collection of transcripts from a single research project",
  "episode", "Series of transcripts from a single sociolinguistic interview",
  "main_participant", "APLS speaker code for the participant being interviewed in a given transcript",
  "participant", "APLS speaker code",
  "transcript", "Transcript file name",
  "transcript_type", "Sociolinguistic interview section"
)
attrib <- attrib |>
  rows_patch(short_desc_attrib, "id")

##Add properties pertaining to how users can interact with attributes
attrib <- attrib |>
  ##All **public** attributes can be exported from https://apls.pitt.edu/labbcat/transcripts
  ##  (though some appear in weird ways--or not at all--depending on the format)
  mutate(transcripts_exportable = access,
         
         ##Whether attribute is a filterable column on https://apls.pitt.edu/labbcat/transcripts or https://apls.pitt.edu/labbcat/participants
         ##  (N.B. episode is filterable for participants despite being a transcript attribute)
         filterable = case_when(
           !access ~ NA,
           attribute %in% c("episode", "participant", "transcript", "type") ~ TRUE,
           attribute %in% c("corpus", "main_participant") ~ FALSE,
           TRUE ~ as.logical(as.numeric(filterable))),
         
         ##Whether attribute shows up on https://apls.pitt.edu/labbcat/transcript/attributes?id=<ID>
         ##  or https://apls.pitt.edu/labbcat/participant?id=<ID>
         attrib_page_viewable = case_when(
           !access ~ "none",
           attribute == "main_participant" ~ "none",
           attrib_type == "transcript" & !is.na(layer_id) ~ "none",
           attrib_type == "transcript" & is.na(layer_id) ~ "transcript",
           attrib_type == "participant" ~ "participant"
         ),
         
         ##Whether attribute can be exported in search matches
         matches_exportable = access & attribute != "main_participant",
         
         ##Do count boxes show up in matches > CSV Export?
         export_includeCounts = case_when(
           !matches_exportable ~ NA, ##Not shown in matches > CSV Export
           multi_select ~ TRUE,
           .default=FALSE)
  )


# Identify files to create/update -----------------------------------------

## Layers =================================================================

##Get existing Markdown files
md_layers <- 
  dir(md_dir_layers, "\\.md$", full.names=TRUE) |>
  str_subset("README\\.md", negate=TRUE) |>
  set_names(~ str_remove(basename(.x), "\\.md$")) |>
  map(read_lines)

##Separate YAML header (lines between 1st & 2nd "---") & Markdown body
yaml_bounds_layers <- map(md_layers, ~ str_which(.x, "^---$"))
##YAML as list
yaml_layers <- map2(md_layers, yaml_bounds_layers, 
                    ~ .x[(.y[1]+1):(.y[2]-1)] |>
                      yaml.load())
##Extract Markdown body
body_md_layers <- map2(md_layers, yaml_bounds_layers,
                       ~ .x[-c(1:.y[2])])

##Get "synced" attributes as a single dataframe
old_synced_layers <-
  yaml_layers |>
  map_dfr(~ .x |>
            pluck("synced") |>
            ##Make sure NULL attributes don't get removed
            map(~ replace(.x, is.null(.x), NA)),
          .id="id")

##If needed, add blank columns to old_synced_layers to match layers
new_cols_layers <- 
  layers |>
  select(-any_of(colnames(old_synced_layers))) |>
  slice(0)
if (nrow(old_synced_layers) > 0) {
  new_cols_layers <- add_row(new_cols_layers)
}
old_synced_layers <- bind_cols(old_synced_layers, new_cols_layers)

##Identify layers that need new files & layers that need updated files
to_create_layers <- anti_join(layers, old_synced_layers, "id")
to_update_layers <- 
  layers |>
  anti_join(to_create_layers, "id") |>
  mutate(across(scope, ~ replace_na(.x, ""))) |>
  anti_join(old_synced_layers, colnames(layers)[-1])


## Attributes =============================================================

##Get existing Markdown files
md_attrib <- 
  dir(md_dir_attrib, "\\.md$", full.names=TRUE) |>
  str_subset("README\\.md", negate=TRUE) |>
  set_names(~ str_remove(basename(.x), "\\.md$")) |>
  map(read_lines)

##Separate YAML header (lines between 1st & 2nd "---") & Markdown body
yaml_bounds_attrib <- map(md_attrib, ~ str_which(.x, "^---$"))
##YAML as list
yaml_attrib <- map2(md_attrib, yaml_bounds_attrib, 
                    ~ .x[(.y[1]+1):(.y[2]-1)] |>
                      yaml.load())
##Extract Markdown body
body_md_attrib <- map2(md_attrib, yaml_bounds_attrib,
                       ~ .x[-c(1:.y[2])])

##Get "synced" attributes as a single dataframe
old_synced_attrib <-
  yaml_attrib |>
  map_dfr(~ .x |>
            pluck("synced") |>
            ##Make sure NULL attributes don't get removed
            map(~ replace(.x, is.null(.x), NA)),
          .id="id") |>
  ##Make sure valid_labels are comparable
  mutate(across(valid_labels, ~ map_depth(.x, 2, as_tibble, .ragged=TRUE)))

##If needed, add blank columns to old_synced_attrib to match attrib
new_cols_attrib <- 
  attrib |>
  select(-any_of(colnames(old_synced_attrib))) |>
  slice(0)
if (nrow(old_synced_attrib) > 0) {
  new_cols_attrib <- add_row(new_cols_attrib)
}
old_synced_attrib <- bind_cols(old_synced_attrib, new_cols_attrib)

##Identify attributes that need new files & attributes that need updated files
public_attrib <- 
  attrib |>
  filter(access) |>
  arrange(id)
to_create_attrib <- anti_join(public_attrib, old_synced_attrib, "id")
to_update_attrib <- 
  public_attrib |>
  anti_join(to_create_attrib, "id") |>
  anti_join(old_synced_attrib, colnames(attrib)[-1])


# Create files for new layers/attributes -------------------------------------

##Get last_sync_modified_date
last_sync_modified_date <- 
  Sys.time() |>
  format("%Y-%m-%dT%H:%M:%S%z")


## Layers ===================================================================

##Add blank properties (to be filled in manually for new layers)
blank_props_layers <- list(last_sync_modified_date = last_sync_modified_date,
                           notation = list(primary = "Main category of notation system (e.g., English, downcased English, Penn Treebank tags, DISC); links to `doc/notation-systems`",
                                           additional = "_If applicable_, symbols that augment the primary notation system (e.g., transcription prosody symbols, morpheme marker, DISC syllabification/stress, foll_segment pause symbol). Delete if not applicable",
                                           missing = "How missing values should be interpreted"),
                           inputs = list(list(input = "Name of input",
                                              type = "layer, dictionary, algorithm, script, transcription, or other"),
                                         list(input = "Name of input",
                                              type = "layer, dictionary, algorithm, script, transcription, or other")),
                           versions = list(first_appeared = "Where layer first appeared",
                                           last_modified = "Where layer was last modified"),
                           last_modified_date = "Handled by Git pre-commit hook")

##List of to-be-created YAML headers
to_create_layers <- to_create_layers |>
  ##Nest synced properties w/in "synced" element
  nest(data = -id) |>
  pull(data, id) |>
  map(~ c(synced = list(.x),
          ##Add blank properties
          blank_props_layers) |>
        ##As a list of YAML headers
        as.yaml(indent.mapping.sequence=TRUE) |>
        ##Remove "Handled by Git pre-commit hook" text so pre-commit hook will
        ##  actually work
        str_remove("Handled by Git pre-commit hook"))

##List of Markdown files to be created
to_create_layers <- to_create_layers |>
  map(~ c("---", paste0(.x, "---"), "",
          "**Fill longer description here**", "",
          "Any headings should be level-3", "", "",
          "{% include linklist.html %}"))

##Optionally write new Markdown files
if (write_new_md_layers) {
  to_create_layers |>
    iwalk(~ write_lines(.x, file.path(md_dir_layers, paste0(.y, ".md")), 
                        sep="\r\n"))
}


## Attributes ===============================================================

##Add blank properties
blank_props_attrib <- list(last_sync_modified_date = last_sync_modified_date,
                           last_modified_date = "Handled by Git pre-commit hook")

##List of to-be-created YAML headers
to_create_attrib <- to_create_attrib |>
  ##Nest synced properties w/in "synced" element
  nest(data = -id) |>
  pull(data, id) |>
  map(~ c(synced = .x |>
            ##Discard properties that aren't applicable
            discard(is.na) |>
            discard(~ length(.x[[1]])==0) |>
            list(),
          ##Add blank properties
          blank_props_attrib) |>
        ##As a list of YAML headers
        as.yaml(indent.mapping.sequence=TRUE) |>
        ##Remove "Handled by Git pre-commit hook" text so pre-commit hook will
        ##  actually work
        str_remove("Handled by Git pre-commit hook"))

##List of Markdown files to be created
to_create_attrib <- to_create_attrib |>
  map(~ c("---", paste0(.x, "---")))

##Optionally write new Markdown files
if (write_new_md_attrib) {
  to_create_attrib |>
    iwalk(~ write_lines(.x, file.path(md_dir_attrib, paste0(.y, ".md")), 
                        sep="\r\n"))
}


# Update files for existing layers/attributes -------------------------------

## Layers ===================================================================

##Make to_update_layers structure match yaml
to_update_layers <- to_update_layers |> 
  nest(synced = -id) |>
  pull(synced, id) |>
  map(~ list(synced = .x))

##For layers in to_update_layers, replace "synced" YAML sublists with
##  to_update_layers
new_yaml_layers <- yaml_layers |>
  list_modify(!!!to_update_layers) |>
  map(~ assign_in(.x, "last_sync_modified_date", last_sync_modified_date)) |>
  keep_at(names(to_update_layers)) |>
  map(as.yaml, indent.mapping.sequence=TRUE) |>
  ##Remove quotes added around last_modified_date
  map(~ str_replace(.x, "last_modified_date: '(.+?)'", "last_modified_date: \\1"))

##Add Markdown body
new_md_layers <- map2(new_yaml_layers, 
                      keep_at(body_md_layers, names(new_yaml_layers)),
                      ~ c("---", str_remove(.x, "\n$"), "---", .y))

##Optionally write updated Markdown files
if (update_existing_md_layers) {
  new_md_layers |>
    iwalk(~ write_lines(.x, file.path(md_dir_layers, paste0(.y, ".md")), 
                        sep="\r\n"))
}


## Attributes ==============================================================

##Make to_update_attrib structure match yaml
to_update_attrib <- to_update_attrib |> 
  nest(synced = -id) |>
  pull(synced, id) |>
  map(~ list(synced = .x |>
               ##Discard properties that aren't applicable
               discard(is.na) |>
               discard(~ length(.x[[1]])==0)))

##For attributes in to_update_attrib, replace "synced" YAML sublists with
##  to_update_attrib
new_yaml_attrib <- yaml_attrib |>
  list_modify(!!!to_update_attrib) |>
  map(~ assign_in(.x, "last_sync_modified_date", last_sync_modified_date)) |>
  keep_at(names(to_update_attrib)) |>
  map(as.yaml, indent.mapping.sequence=TRUE) |>
  ##Remove quotes added around last_modified_date
  map(~ str_replace(.x, "last_modified_date: '(.+?)'", "last_modified_date: \\1"))

##Add Markdown body
new_md_attrib <- map2(new_yaml_attrib, 
                      keep_at(body_md_attrib, names(new_yaml_attrib)),
                      ~ c("---", str_remove(.x, "\n$"), "---", .y))

##Optionally write updated Markdown files
if (update_existing_md_attrib) {
  new_md_attrib |>
    iwalk(~ write_lines(.x, file.path(md_dir_attrib, paste0(.y, ".md")), 
                        sep="\r\n"))
}


# Create JavaScript for layer title ------------------------------------------

##Construct new JavaScript
js_top <- c("var title;",
            "switch (exportName) {")
js_bottom <- c("}",
               "if (title !== undefined) {",
               "  a.title = title;",
               "}")
combined <- bind_rows(layers |> 
                        select(id, short_description),
                      public_attrib |>
                        select(id, short_description))
js_middle <-
  combined |>
  rowwise() |>
  mutate(new = list(c(paste0("  case '", id, "':"),
                      paste0("    title = `", short_description, "`;"),
                      "    break;"))) |>
  pull(new) |>
  unlist()

##Read JS file to inject into and find location of block for injection
js_file <- read_lines(js_path)
js_bounds <- str_which(js_file, "//(BEGIN|END) generated by /_layers/sync-layers\\.R")
js_before <- js_file[1:js_bounds[1]]
js_after <- js_file[js_bounds[2]:length(js_file)]

##Inject into block
js_indent <- str_remove(js_file[js_bounds[1]], "//.+")
js_inject <- paste0(js_indent, c(js_top, js_middle, js_bottom))
new_js <- c(js_before,
            js_inject,
            js_after)

##Optionally write updated JavaScript file
if (update_existing_js_file) {
  write_lines(new_js, js_path)
}


# Optionally write session info -------------------------------------------

if (!is.null(session_info)) {
  writeLines(capture.output(sessionInfo()), session_info)
}
