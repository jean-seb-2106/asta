## code to prepare `chomage_bit` dataset goes here

fichier <- "data-raw/dataset/chomagebrut.csv"

chomage_bit <- read.csv(fichier) 
chomage_bit <- ts(chomage_bit,
              start = c(2003,1),
              end = c(2019,4),
              frequency = 4)

usethis::use_data(chomage_bit, overwrite = TRUE)
