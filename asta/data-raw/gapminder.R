## code to prepare `grandile` dataset goes here


library(dplyr)

gapminder <- readRDS("data-raw/dataset/gapminder_asta.RDS")


usethis::use_data(gapminder, overwrite = TRUE)
