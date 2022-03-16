#' table_ponderee 
#'
#' @description Fonction qui crée une table pondérée
#'
#' @return un dataframe
#' 
#' @param data_pond un dataframe
#' @param var_pond une variable de redressement
#' 
#' @export
#'
#' @examples 
#' pond_m2(grandile_redress, "ACT")
#' 
pond_m2 <- function(data_pond, var_pond){
  tab1 <- data_pond %>% 
    mutate(pond1=1/(sum(ECH,na.rm = TRUE)/nrow(grandile))) 
  
  tab2 <- data_pond  %>%   dplyr::group_by(.data[[var_pond]]) %>% summarise(somme_rep=sum(REPONDANT), somme_ech=sum(ECH)) %>% 
    mutate(pond2= somme_ech/somme_rep)
  
  tab_red <- tab1 %>% left_join(tab2) %>% mutate(PONDEF=pond1*pond2) %>% filter(REPONDANT==1) %>% 
    mutate(REV_DISPONIBLE_POND=REV_DISPONIBLE*PONDEF, 
           PATRIMOINE_POND = PATRIMOINE*PONDEF)
  tab_red
  
}
