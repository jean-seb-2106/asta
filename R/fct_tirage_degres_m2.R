#' tirage_degres_m2 
#'
#' @description A fct function that does a cluster sampling with 2 sample random sampling
#'
#' @return a dataframe, result of a cluster sampling with 2 samplings
#'
#' @export
#' @example tirage_grappe_m2("Grandile.RDS", 2, "DIPL")
tirage_degres_m2 <-
  function(input_data,
           taille_UP,
           taille_tot,
           var_degres) {
    UP <-
      file_grandile_m2(input_data) %>% group_by(.data[[var_degres]]) %>%
      summarise(Effectifs = n()) %>% select(.data[[var_degres]])
    
    sond1 <-
      UP[sample(1:nrow(UP), taille_UP), ] %>% mutate(ECH = "1")  %>%
      right_join(file_grandile_m2(input_data), by = var_degres) %>%
      filter(ECH == "1")
    
    sond2 <- tirage_strat_m2(input_data, taille_tot, var_degres)
    sond2
  }