# setup.R

library(tidyverse, 
        verbose = FALSE, 
        quietly = TRUE, 
        warn.conflicts = FALSE)

library(ymlthis)
library(usethis)
library(fs)

build_toc <- function(filename) {
  text <- read_file(filename)
  recipes <- text %>% 
    stringr::str_extract_all("\\n##\\s.+\\n") %>% 
    pluck(1) %>% 
    `[`(-1) %>% 
    stringr::str_replace_all("\\s\\{.*\\}", "") %>%
    stringr::str_replace_all("\\n##\\s", "1. [") %>% 
    stringr::str_replace_all("\\n", "]")
  headers <- paste(recipes, collapse = "\n")
  cat("<div class='col2'>\n", headers, "\n</div>") 
}

# for side-by-side images. path must be in quotes, width just a #.
side_by_side <- function(path1, width1, path2, width2){
  style2 <- paste0("padding-left: 1rem; width: ", width2, "%;")
  style1 <- paste0("width: ", width1, "%;")
  
  htmltools::withTags(
    div(style = "display: flex;",
          div(style = style1, 
              htmltools::img(src = path1)), 
          div(style = style2, 
              htmltools::img(src = path2))
    )
  )
}