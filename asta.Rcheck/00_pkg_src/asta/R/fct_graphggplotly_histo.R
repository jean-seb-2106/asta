#' graphggplotly_histo
#' 
#' Fonction qui permet de créer un histogramme 
#' avec la moyenne et la médiane
#'
#' @param data un dataframe
#' @param var une variable quantitative
#' @param nbclass nombre de classes de l'histogramme
#'
#' @return un graphique de type plotly
#' @export
#'
#' @examples
#' graphggplotly_histo(grandile,"REV_DISPONIBLE",10)
graphggplotly_histo <- function(data,var,nbclass){
  x <- data[,var]
  y <- ggplot(data) +
    aes(x=.data[[var]]) +
    geom_histogram(bins = nbclass,col="black",fill="lightgrey") +
    theme_minimal() +
    geom_vline(xintercept = mean(x),color="red") +
    geom_vline(xintercept = median(x),color="darkgreen")
  
  y %>% ggplotly()
  
}