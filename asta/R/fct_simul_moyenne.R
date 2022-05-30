#' simul_moyenne
#'
#' Fonction qui simule une série d'estimations d'indicateurs 
#' à l'aide de la moyenne empirique
#'
#' @param data un dataframe
#' @param var une variable quantitative
#' @param taille_echant taille de l'échantillon tiré
#' @param nbr_simul nombre de tirage d'échantillons
#'
#' @return un vecteur numérique
#' @export
#'
#' @examples  simul_moyenne(grandile,"AGE",1000,1000) 
simul_moyenne <- function(data,var,taille_echant,nbr_simul){
  replicate(nbr_simul, {
    a <- data %>% sample_n(taille_echant)
    b <- mean(a[,var])
    b 
  })
}