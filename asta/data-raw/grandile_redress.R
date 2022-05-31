## code to prepare `grandile` dataset goes here

library(readxl)
library(dplyr)

grandile_redress <- readRDS("data-raw/dataset/Grandile_redress.RDS")
grandile_redress <- grandile_redress %>% 
  mutate(REPONDANT_C = as.character(REPONDANT)) %>% as.data.frame()

usethis::use_data(grandile_redress, overwrite = TRUE)
