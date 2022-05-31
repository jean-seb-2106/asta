## code to prepare `hotel` dataset goes here

# https://www.insee.fr/fr/statistiques/serie/010599344#Telechargement

library(lubridate)
library(dplyr)

hotel <- read.csv2(file = "data-raw/dataset/valeurs_mensuelles.CSV",
                   fileEncoding = "UTF8",header = FALSE,
                   skip = 4)  %>%
  mutate(V1 = ym(V1)) %>%
  arrange(V1) %>%
  mutate(V2 = as.numeric(V2))%>%
  select(V1,V2)

hotel <- ts(hotel$V2, start=c(2011,1),frequency = 12)
hotel <- window(hotel,start = c(2011,1),end = c(2019,12))

usethis::use_data(hotel, overwrite = TRUE)
