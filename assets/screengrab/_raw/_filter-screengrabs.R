#!/usr/bin/env Rscript

##List screengrabs that satisfy filter criteria
##(e.g., --file=, --element=, --folder=, --no-folder=, --no-in-path)

manip_key <- "_manip-key.yml"
library(optparse)
library(yaml)
library(purrr)
suppressPackageStartupMessages(library(dplyr))
library(tidyr)

parser <- OptionParser(usage="%prog [options]")
parser <- parser |>
  add_option("--file", default=".*", help="filename inclusion regex (not including folder)") |>
  add_option("--no-file", default="", help="filename exclusion regex (not including folder)") |>
  add_option("--folder", default=".*", help="folder inclusion regex") |>
  add_option("--no-folder", default="", help="folder exclusion regex") |>
  add_option("--element", default="", help="element inclusion regex") |>
  add_option("--no-element", default="", help="element exclusion regex") |>
  add_option("--in-path", action="store_true", default=FALSE, help="only include screengrabs with in_path") |>
  add_option("--no-in-path", action="store_true", default=FALSE, help="only include screengrabs without in_path") |>
  add_option("--downstream", action="store_true", default=FALSE, help="also include screengrabs whose in_path is selected by these filters") |>
  add_option("--upstream", action="store_true", default=FALSE, help="also include screengrabs that serve as in_path to those selected by these filters") |>
  add_option("--downstream-only", action="store_true", default=FALSE, help="only include screengrabs whose in_path is selected by these filters") |>
  add_option("--upstream-only", action="store_true", default=FALSE, help="also include screengrabs that serve as in_path to those selected by these filters")
opt <- parse_args(parser, convert_hyphens_to_underscores=TRUE)
if (opt$downstream_only && opt$upstream_only) {
  stop("Can't select both downstream-only and upstream-only")
}
if (opt$downstream && opt$upstream_only) {
  warning("Showing upstream-only, ignoring downstream")
}
if (opt$upstream && opt$downstream_only) {
  warning("Showing downstream-only, ignoring upstream")
}

screengrabs <- read_yaml(manip_key)$screengrabs

screengrabs <- screengrabs |>
  map(\(x) keep_at(x, c("screengrab", "elements", "in_path"))) |>
  bind_rows() |>
  chop(elements) |>
  filter(screengrab != "") |>
  mutate(folder = dirname(screengrab),
         file = basename(screengrab),
         .after=screengrab) |>
  arrange(tools::file_path_sans_ext(screengrab))

filtered <- screengrabs
if (opt$file != "") {
  filtered <- filtered |>
    filter(grepl(opt$file, file))
}
if (opt$no_file != "") {
  filtered <- filtered |>
    filter(!grepl(opt$no_file, file))
}
if (opt$folder != "") {
  filtered <- filtered |>
    filter(grepl(opt$folder, folder))
}
if (opt$no_folder != "") {
  filtered <- filtered |>
    filter(!grepl(opt$no_folder, folder))
}
if (opt$element != "") {
  filtered <- filtered |>
    filter(map_lgl(elements, \(x) any(grepl(opt$element, x))))
}
if (opt$no_element != "") {
  filtered <- filtered |>
    filter(!map_lgl(elements, \(x) any(grepl(opt$no_element, x))))
}
if (opt$in_path) {
  filtered <- filtered |>
    filter(!is.na(in_path))
}
if (opt$no_in_path) {
  filtered <- filtered |>
    filter(is.na(in_path))
}
if (opt$downstream || opt$downstream_only) {
  downstream <-
    screengrabs |>
    semi_join(filtered, join_by(in_path == screengrab))
}
if (opt$upstream || opt$upstream_only) {
  upstream <-
    screengrabs |>
    semi_join(filtered, join_by(screengrab == in_path))
}
if (opt$downstream_only) {
  out <- downstream$screengrab
} else if (opt$upstream_only) {
  out <- upstream$screengrab
} else if (opt$downstream || opt$upstream) {
  out <- list(filtered = filtered$screengrab)
  if (opt$downstream) {
    out <- c(out, downstream = downstream$screengrab)
  }
  if (opt$upstream) {
    out <- c(out, upstream = upstream$screengrab)
  }
} else {
  out <- filtered$screengrab
}

out
