#### convertDict.R
#### Dan Villarreal
####
#### Hosts a function, convertDict(), to convert a dictionary from internal to
#### txt format for APLS Elan File Checker.
####

convertDict <- function(x, outFile=NULL, format=c("txt", "md")) {
  library(readr)
  library(stringr)
  library(purrr)
  
  ##Read & process file
  inFile <- read_file(x)
  ##Get headers and sections
  headers <- str_extract_all(inFile, "//.+")[[1]] %>%
    str_replace("// ", "##")
  sections <- str_split(inFile, "//.+[\r\n]+")[[1]][-1]
  
  ##Get entries by section
  entries <- sections %>% 
    map(~ .x %>% 
          ##Each entry in its own string
          str_split("[\r\n]+") %>% 
          pluck(1) %>%
          ##Remove DISC
          str_remove(",.+$") %>% 
          ##Remove blank lines
          str_subset(".+") %>%
          ##Unique & sort
          unique() %>% 
          sort())
  
  ##Remove empty elements
  empty <- map_lgl(entries, ~ length(.x)==0)
  headers <- headers[!empty]
  entries <- entries[!empty]
  ##Add two blank lines after each section
  dict <- map2(headers, entries, c, "", "") %>% 
    ##Atomic character vector
    flatten_chr()
  
  ##Optionally save
  if (!is.null(outFile)) {
    outFile <- tools::file_path_sans_ext(outFile)
    if ("txt" %in% format) {
      writeLines(dict, paste0(outFile, ".txt"))
    }
    if ("md" %in% format) {
      mdHead <- "# APLS custom dictionary"
      writeLines(dict, paste0(outFile, ".txt"))
    }
  }
  
  cat("Writing dictionary with", length(flatten_chr(entries)), "entries across",
      length(headers), "sections", fill=TRUE)
  
  ##Return dictionary invisibly
  invisible(dict)
}
