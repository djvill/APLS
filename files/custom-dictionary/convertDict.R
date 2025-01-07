#### convertDict.R
#### Dan Villarreal
####
#### Hosts a function, convertDict(), to convert a dictionary from internal to
#### output formats: txt (for the APLS Elan File Checker) and/or md (for
#### djvill.github.io/APLS)
####


convertDict <- function(x, outFile=NULL, skip=0) {
  library(readr)
  library(stringr)
  library(purrr)
  
  ##Source validateDict.R
  vdFile <- "validateDict.R"
  if (file.exists(vdFile)) {
    source(vdFile)
  } else {
    stop("Working directory must contain ", vdFile)
  }
  
  ##Read & process file
  inFile <- read_lines(x, skip=skip)
  ##Get headers and sections
  headers <- str_subset(inFile, "^//") %>% 
    str_remove("// ")
  sections <-
    inFile %>% 
    paste(collapse="\n") %>% 
    ##Split at section headers not at the start of the file
    str_split_1("(?<!^)//.+[(\r?)\n]+") %>% 
    ##Remove headers and add as names
    str_remove("^//.+?(\r?)\n") %>% 
    set_names(headers)
  
  ##Get a dataframe of entries
  dict <- 
    sections %>% 
    map_dfr(~ read_delim(.x, ",", col_names=c("Word","DISC"), col_types="cc", quote=""),
            .id="Section")
  
  ##Exit with error if dictionary isn't valid
  vd <- validateDict(dict)
  if (length(vd) > 0) {
    stop("validateDict() detected formatting errors in the following entries:\n",
         paste(capture.output(print(vd)), collapse = "\n"), # https://stackoverflow.com/a/26083626
         "\n\nPlease fix errors and re-run")
  }
  
	
  ##Optionally save
  if (!is.null(outFile)) {
    exts <- tools::file_ext(outFile)
    
    warned <- FALSE
    if (any(exts %in% c("txt", "md"))) {
      ##Format for output
      dictOut <- 
        dict %>% 
        ##Word as list-col, section as header
        summarize(Word = list(sort(unique(Word))),
                  .by=Section) %>%
        mutate(across(Section, ~ paste("##", .x)))
      
      cat("Writing dictionary with", nrow(dict), "entries across",
          nrow(dictOut), "sections...", fill=TRUE)
      
      if (any(exts == "txt")) {
        ##Format with two blank lines after each section
        dictTxt <-
          dictOut %>% 
          with(map2(Section, Word, c, "", "")) %>% 
          ##As an (atomic) character vector
          flatten_chr()
        
        ##Write
        txtFile <- outFile[exts == "txt"]
        writeLines(dictTxt, txtFile)
        cat("  Wrote", txtFile, fill=TRUE)
      }
      if (any(exts == "md")) {
        ##Dictionary body
        dictMD <- 
          dictOut %>% 
          ##Format sections as unordered list, with block IAL (Kramdown) for formatting
          mutate(Word = map(Word, ~ paste("-", .x))) %>% 
          with(map2(Section, Word, c, "{:.wrap .fb-10}", "")) %>% 
          ##As an (atomic) character vector
          flatten_chr()
        
        ##Add Markdown front matter
        mdHead <- c("---",
                    "title: Custom dictionary entries",
                    "layout: default",
                    "permalink: /files/custom-entries",
                    "parent: Custom dictionary",
                    "search_exclude: true",
                    "last_modified_date:",
                    "---",
                    "",
                    "# {{ page.title }}",
                    "{:.no_toc}",
                    "",
                    "These dictionary entries supplement APLS's default dictionary, the [Unisyn](https://www.cstr.ed.ac.uk/projects/unisyn/) lexicon for American English.",
                    "With over 110,000 entries, Unisyn covers the vast majority of the words in any given transcript.",
                    "These custom entries just fill in the gaps.",
                    "",
                    "{% include page_toc.html collapsible=true %}",
                    "")
        dictMD <- c(mdHead, dictMD)
        
        ##Write
        mdFile <- outFile[exts == "md"]
        writeLines(dictMD, mdFile)
        cat("  Wrote", mdFile, fill=TRUE)
      }
    } else {
      warning("Only .txt & .md file types supported. No files written.")
      warned <- TRUE
    }
    
    if (!warned && !all(exts %in% c("txt", "md"))) {
      warning("Only .txt & .md file types supported")
    }
  }
  
  ##Return dictionary invisibly
  invisible(dict)
}
