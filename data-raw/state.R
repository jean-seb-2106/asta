## code to prepare `grandile` dataset goes here

library(readxl)
library(dplyr)

state <- readRDS("data-raw/dataset/state.RDS")


usethis::use_data(state, overwrite = TRUE)
