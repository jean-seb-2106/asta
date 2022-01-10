## code to prepare `grandile` dataset goes here

library(readxl)
library(dplyr)

grandile_redress <- readRDS("data-raw/dataset/Grandile_redress.RDS")


usethis::use_data(grandile_redress, overwrite = TRUE)
