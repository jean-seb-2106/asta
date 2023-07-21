## code to prepare `departements` dataset goes here

library(dplyr)

departements <- read.csv2("data-raw/dataset/statloc.csv", sep=";")
regions <- read.csv2("data-raw/dataset/region_2022.csv", sep=",") %>% select(REG, GR_REG)
tabpass <- read.csv2("data-raw/dataset/tabpass_dep_reg.csv", sep=",") %>% select(DEP, REG)

#on enrichit avec une variable de région
departements <- departements %>% left_join(tabpass,by=c("Code" = "DEP"))
departements <- departements %>% left_join(regions,by="REG")
table(departements$GR_REG)

#on passe les noms des départements en rownames
rownames(departements) <- departements$Libelle
departements <- departements %>% select(-Libelle, -Code, -REG)

#On enlève quelques variables pour pas qu'il n'y en ait trop
departements <- departements %>% select(-Part_0015, -Part_menages_imposes, -Niv_vie_median, -Tx_cambriolages,
                                        -Part_revenus_du_patrimoine, -Tx_procurations, -Tx_coups_blessures, -Part_salaries)

usethis::use_data(departements, overwrite = TRUE)
