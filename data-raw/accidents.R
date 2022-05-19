## code to prepare `accidents` dataset goes here

accidents <- readRDS("data-raw/dataset/accidents.rds")

usethis::use_data(accidents, overwrite = TRUE)
