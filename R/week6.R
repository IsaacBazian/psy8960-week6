# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(rebus)
library(stringi)


# Data Import
citations <- stri_read_lines("../data/citations.txt")
citations_txt <- citations[!(stri_isempty(citations))]
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, 10)

citations_tbl <- tibble(line = 1:length(citations_txt), cite = citations_txt) %>%
  mutate(cite = str_replace_all(string = cite, pattern = regex("[\"\']"), replacement = ""))






