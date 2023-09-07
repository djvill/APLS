#### validateDict.R
#### Dan Villarreal
####
#### Hosts a function, validateDict(), to check whether a dictionary dataframe
#### conforms to APLS specifications
####

validateDict <- function(x) {
  if (!is.data.frame(x))
    stop("x must be a data.frame")
  if (!all(c("Word", "DISC") %in% colnames(x)))
    stop("x must include columns Word,DISC")
  
  library(dplyr)
  library(stringr)
  library(purrr)

  ##Validate wordforms
  wordChars <- "[[:alpha:]'-]"
  tilde <- "~?$"
  validWord <- paste0("^", wordChars, "+", tilde)
  badCharsWord <-
    x %>% 
    filter(!str_detect(Word, validWord)) %>% 
    mutate(BadChars_Word = str_remove_all(Word, paste0(wordChars, "|", tilde))) %>% 
    select(-DISC)
  
  ##Validate DISC codes
  pronChars <- "[pbtdkgNmnlrfvTDszSZjhwJ_CFHPIE{VQU@i$u312456789#'\"-]"
  validDISC <- paste0("^", pronChars, "+$")
  badCharsDISC <- 
    x %>% 
    filter(!str_detect(DISC, validDISC)) %>%
    mutate(BadChars_DISC = str_remove_all(DISC, pronChars))
  
  ##Validate escaped quotation marks
  badQuote <-
    x %>% 
    ##Don't flag word-internal " or correctly-escaped "
    filter(!str_detect(DISC, '^[^"]+("?[^"]+)?'),
           !str_detect(DISC, '^"""[^"]+"$'))
  
  ##Return errors, if any
  list("Invalid word characters" = badCharsWord,
       "Invalid DISC characters" = badCharsDISC,
       "Invalid double-quotes" = badQuote) %>% 
    keep(~ nrow(.x) > 0) %>% 
    map(as.data.frame)
}