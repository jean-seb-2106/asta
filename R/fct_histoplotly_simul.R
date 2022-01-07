#' histoplotly_simul
#'
#' Histogramme de la simulation d'estimation avec la moyenne empirique
#'
#' @param serie un vecteur numérique
#' @param var une variable quantitative
#'
#' @return un graphique GGPLOT2
#' @export
#'
#' @examples 
#' a <- simul_moyenne(grandile,"AGE",1000,1000)
#' histoplotly_simul(a,"AGE")
histoplotly_simul <- function(serie,var){
  a <- serie %>% as.data.frame() %>% rename(!!{{var}} := ".")
  ggplot(a) + aes(.data[[var]])+geom_histogram()
  
}
