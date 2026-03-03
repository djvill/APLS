#!/usr/bin/env R

##bib-to-yml.R
##Usage:
##  Rscript bib-to-yml.R IN_FILE.bib > OUT_FILE
##For setup, see README

in_file <- commandArgs(trailingOnly=TRUE)
if (length(in_file) != 1) {
  stop("This script requires an input file as an argument.")
}
if (!endsWith(in_file, ".bib")) {
  stop("Input file must be have .bib extension")
}

library(cffr)
library(bibtex)
library(purrr)
library(tibble)
library(tidyr)
library(dplyr)
library(yaml)

##Read as cff (with cite-keys from read.bib())
x <- cff_read(in_file)
nm <- read.bib(in_file)

##Wrangle
tibble(lst = as.list(x)) |>
  unnest_wider(lst, names_repair=\(x) gsub("-", "_", x)) |>
  ##Add cite key, sort
  mutate(cite = names(nm),
         sort_string = paste(authors |> 
                               map_chr(\(x) x |> 
                                         map_chr("family-names") |> 
                                         paste(collapse=" ")),
                             year,
                             tolower(title))) |>
  arrange(sort_string) |>
  ##wrangle columns
  mutate(across(c(authors, editors),
                \(x) x |>
                  map_if(\(x) !is.null(x),
                         \(x) x |>
                           map(\(x) paste(x$`given-names`, x$`family-names`)) |>
                           list_c())),
         pages = if_else(!is.na(start),
                         paste0(start, "--", end),
                         NA),
         across(journal, \(x) gsub("\\\\&", "&", x)),
         url = if_else(!is.na(doi), NA, url),
         ##cff_read() import bug
         across(title, \(x) sub('"Pittsburghese$', '"Pittsburghese"', x))) |>
  ##Wrangle publisher/institution/place
  unnest_wider(c(publisher, institution), names_sep="_") |>
  mutate(publisher = publisher_name,
         institution = institution_name,
         place = coalesce(publisher_address, institution_address)) |>
  select(cite, type, authors, title, year, journal, volume, issue,
         editors, book_title = collection_title, place, publisher, 
         institution, thesis_type, 
         pages, url, doi) |>
  ##Format for YAML
  transpose() |>
  map(\(x) x |>
        discard(is.null) |>
        discard(\(x) length(x) == 1 && is.na(x)) |>
        modify_at(c("year", "volume", "issue"),
                  \(x) ifelse(grepl("^\\d+$", x), as.integer(x), x))) |>
  ##As YAML
  as.yaml() |>
  cat()
