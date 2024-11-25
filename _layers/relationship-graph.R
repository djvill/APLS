##
## relationship-graph.R
## Dan Villarreal (d.vill@pitt.edu)
##
## Outputs a .gv file for depicting relationships between layers and their inputs
## Meant to be used on the command line
##

##Parameters
##Directory for Markdown files
md_dir <- "."
##Types and shapes
node_shapes <- tibble::tribble(
  ~type,           ~shape,
  "transcription", "note",
  "dictionary",    "rect",
  "script",        "diamond",
  "algorithm",     "Mdiamond",
  "layer",         "ellipse"
)

##Ensure correct working directory
if (basename(getwd()) != "_layers") {
  stop("Please change working directory.")
}

##Packages
suppressPackageStartupMessages(library(tidyverse))
library(yaml)

##Get existing Markdown files
md <- 
  dir(md_dir, "\\.md$", full.names=TRUE) |>
  str_subset("README\\.md", negate=TRUE) |>
  set_names(~ str_remove(basename(.x), "\\.md$")) |>
  map(read_lines)

##Separate YAML header (lines between 1st & 2nd "---") & Markdown body
yaml_bounds <- map(md, ~ str_which(.x, "^---$"))
##YAML as list
yaml <- map2(md, yaml_bounds, 
             ~ .x[(.y[1]+1):(.y[2]-1)] |>
               yaml.load())

##Get relationships as dataframe
relationships <-
  yaml |>
  map("inputs") |>
  discard(is.null) |>
  map_dfr(~ .x |>
            transpose() |>
            map(unlist) |>
            as_tibble(),
          .id="layer")

##Nodes (both inputs and 'terminal' layers)
nodes <- rbind(relationships |>
                 distinct(node = input, type),
               relationships |>
                 distinct(node = layer) |>
                 mutate(type = "layer")) |>
  distinct() |>
  ##Add node_id for more concise Graphviz
  mutate(across(type, ~ factor(.x, node_shapes$type))) |>
  arrange(type, node) |>
  mutate(node_id = as.integer(fct_inorder(node)))

##Graphviz node definitions
gvNodes <- 
  ##List of node DFs
  nodes |>
  left_join(node_shapes, "type") |>
  nest(data = -type) |>
  pull(data, type) |>
  ##As a character vector of Graphviz defs
  imap(~ c(str_glue("//{.y}"), 
           str_glue_data(.x, '{node_id} [label="{node}", shape={shape}]'))) |>
  reduce(c)

##Graphviz edge definitions (4 definitions per line)
gvEdges <-
  relationships |>
  left_join(nodes |> select(input = node, left_id = node_id), "input") |>
  left_join(nodes |> select(layer = node, right_id = node_id), "layer") |>
  arrange(left_id, right_id) |>
  summarize(across(type, unique),
            edges = paste0(unique(left_id), " -> ", 
                           ifelse(length(right_id) > 1, 
                                  paste0("{", str_flatten(right_id, " "), "}"),
                                  right_id)),
            .by=left_id) |>
  # summarize(across(edges, ~ str_flatten(.x, "; ")),
  #           .by=type) |>
  mutate(group = (row_number()-1) %/% 4) |>
  summarize(across(edges, ~ str_flatten(.x, "; ")),
            .by=group) |>
  pull(edges)

##Full graphviz
gv <- c("strict digraph relationships {",
        paste0("  ", gvNodes),
        "",
        paste0("  ", gvEdges),
        "}")

##Return
cat(gv, sep="\n")
