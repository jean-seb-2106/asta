## code to prepare `grandile_apur` dataset goes here

library(readxl)
library(dplyr)

grandile_apur <- read.csv("data-raw/dataset/repondants.csv")
grandile_apur <- grandile_apur %>%   
  mutate(SUPERF_PAR_PIECE = SUPERF_LOG/NBPIECES, SUPERF_PAR_PERSONNE = SUPERF_LOG/NBPERS) %>% 
  as.data.frame()

usethis::use_data(grandile_apur, overwrite = TRUE)
