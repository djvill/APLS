library(tidyr)
library(purrr)
library(stringr)
library(dplyr)
library(yaml)

##Parameters: Glossary & template files, whether or not to write updated glossary
file_glossary <- "keyterms.yml"
file_template <- "keyterm-template.yml"
write_glossary <- TRUE

##Get terms from pages
##Get doc/ pages that have 1+ .keyterm
pages <- system("grep -rl 'class=\"keyterm' ../doc", intern=T)
##Construct dataframe of terms and the pages where they appear
keyterms <- tibble(page = pages,
                   pagefile = map(page, readLines),
                   pagelink = map_chr(pagefile, 
                                      ~ .x |>
                                        str_subset("^permalink: ") |>
                                        str_remove("^permalink: ")),
                   pagetitle = map_chr(pagefile, 
                                       ~ .x |>
                                         str_subset("^title: ") |>
                                         str_remove("^title: ")),
                   term = map(pagefile, 
                              ##Get keyterms as a character vector
                              ~ .x |> 
                                str_extract_all("(?<=<span class=\"keyterm\">).+?(?=</span>)") |>
                                unlist() |>
                                ##Normalize for case and pluralization
                                str_to_lower() |>
                                str_remove("s$"))) |>
  ##One row per term
  unnest(term) |>
  ##Only unique combinations of page/term
  distinct() |>
  ##Add link
  mutate(link = str_glue("[{pagetitle}]({pagelink}#keyterm-{str_replace_all(term, ' ', '-')})") |>
           as.character())

##Read template & empty out incontext
template <- read_yaml(file_template)[[1]]
template$incontext <- character(0L)

##Add to glossary
##Read current glossary
glossary <- read_yaml(file_glossary)
##Get terms that need to be added
curr_terms <- names(glossary)
new_terms <- setdiff(keyterms$term, str_to_lower(curr_terms))
##Repeat template with new_terms
new_gloss <- new_terms |>
  sort() |>
  set_names() |>
  map(~ template)
##Add new_terms
glossary <- c(glossary, new_gloss)

##Update terms' incontext entries
##Get list of backlinks for each term
backlinks <- 
  keyterms |>
  select(term, link) |>
  chop(link) |>
  pull(link, term)
##In glossary order
backlinks <- backlinks[str_to_lower(names(glossary))]
##Update incontext
glossary <- glossary |> 
  map2(backlinks, ~ assign_in(.x, "incontext", .y))

##Optionally write glossary
if (write_glossary) {
  write_yaml(glossary, file_glossary)
}
