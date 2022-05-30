## code to prepare `airpass` dataset goes here

airpass <- readRDS("data-raw/dataset/airpass.rds")

usethis::use_data(airpass, overwrite = TRUE)
