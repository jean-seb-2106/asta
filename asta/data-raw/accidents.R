## code to prepare `accidents` dataset goes here

accidents <- readRDS("data-raw/dataset/accidents.rds")
accidents <- window(accidents,start = c(1974,1),end = c(2007,12))

usethis::use_data(accidents, overwrite = TRUE)
