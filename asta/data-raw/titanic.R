## code to prepare `grandile` dataset goes here

library(readxl)
library(dplyr)

titanic <- readRDS("data-raw/dataset/titanic.rds")


usethis::use_data(titanic, overwrite = TRUE)
