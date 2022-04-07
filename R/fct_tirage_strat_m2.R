#' tirage_strat_m2 
#'
#' @description A fct function that does a stratified random sampling without replacement
#' @param input_data un dataframe
#' @param taille_strat un nombre de strates
#' @param var_strat une variable de stratification
#'
#' @return a dataframe, result of a stratified sampling without replacement
#' @import dplyr
#' @import sampling
#' @export
#' @examples tirage_strat_m2(grandile, 400, "DIPL")
tirage_strat_m2 <- function(input_data, taille_strat, var_strat) {
  tab <- input_data %>%   select(var_strat)
  
  v <- table(tab)
  
  x <- v / nrow(input_data)
  
  y <- x * taille_strat
  
  base_echantillon_strat <-
    input_data %>% arrange(var_strat) #attention ajouter un .data[[]] ou autre, le arrange ne marche#
  
  s = strata(
    base_echantillon_strat,
    stratanames =
      var_strat,
    size = y,
    method = "srswor"
  )
  echantillon_strat <- getdata(base_echantillon_strat, s)
  
}