## code to prepare `grandile_apur` dataset goes here

library(readxl)
library(dplyr)

grandile_apur <- read.csv("repondants.csv") %>% dplyr::select(-MODCOHA, -AGE, -DIPL, -PCS, -ACT, -REV_AV_REDISTRIB, -ADULTE,
                                                              -ENFANT_MOINS14, -ENFANT_PLUS14, -UC, -NV, -ALEA, -PATRIMOINE, - REV_DISPONIBLE) %>% 
  as.data.table()

usethis::use_data(grandile_apur, overwrite = TRUE)
