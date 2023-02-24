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
  mutate(cite = str_replace_all(string = cite, pattern = stringr::regex("[\"\']"), replacement = "")) %>%
  mutate(year = str_match(string = cite, pattern = OPEN_PAREN %R% capture(one_or_more(DGT)) %R% CLOSE_PAREN)[,2]) %>% 
  mutate(page_start = str_match(string = cite, pattern = capture(one_or_more(DGT)) %R% "-")[,2]) %>% 
  mutate(perf_ref = str_detect(string = cite, pattern = stringr::regex("performance", ignore_case = T))) %>% 
  mutate(title = str_match(string = cite, pattern = "\\)\\.\\s([^\\.]+[.?!])")[,2])






