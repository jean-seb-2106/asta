#' tirage_sas_m2 
#'
#' @description A fct function that does a simple random sampling (sas)
#' @param input_data un dataframe
#' @param taille_sas un nombre d'unités échantillonné
#'
#' @return a dataframe, result of a simple random sampling
#'
#' @export
#' @example tirage_sas_m2(file_grandile_m2("Grandile.RDS"), 12)
tirage_sas_m2 <- function(input_data, taille_sas) {
  echantillon_sas <-
    input_data[sample(1:nrow(input_data), taille_sas),]
  echantillon_sas
}