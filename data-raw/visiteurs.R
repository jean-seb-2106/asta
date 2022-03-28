## code to prepare `visiteurs` dataset goes here

visiteurs <- ts(c(7,5,35,5,6,8,9,45,8,9,10,11,42,9,11),start = 1,frequency = 5)

usethis::use_data(visiteurs, overwrite = TRUE)
