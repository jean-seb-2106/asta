#' tirage_strat_m2 
#'
#' @description A fct function that does a stratified random sampling without replacement
#'
#' @return a dataframe, result of a stratified sampling without replacement
#' @import dplyr
#' @import sampling
#' @noRd
#' @example tirage_strat_m2("Grandile.RDS", 400, "DIPL")
tirage_strat_m2 <- function(input_data, taille_strat, var_strat) {
  tab <- file_grandile_m2(input_data) %>%   select(.data[[var_strat]])
  
  v <- table(tab)
  
  x <- v / nrow(file_grandile_m2(input_data))
  
  y <- x * taille_strat
  
  base_echantillon_strat <-
    file_grandile_m2(input_data) %>% arrange(var_strat)
  
  s = strata(
    base_echantillon_strat,
    stratanames =
      var_strat,
    size = y,
    method = "srswor"
  )
  echantillon_strat <- getdata(base_echantillon_strat, s)
  
}