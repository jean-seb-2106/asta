#' graphggplotly_nuage
#'
#' Fonction pour produire un nuage de points avec la droite de  
#' regression linéaire associée
#'
#' @param data un dataframe 
#' @param var1  une variable quantitative
#' @param var2  une variable quantitative
#'
#' @return un graphique ggplotly
#' @export
#'
#' @examples
#' graphggplotly_nuage(grandile,"REV_DISPONIBLE","PATRIMOINE")
graphggplotly_nuage <- function(data,var1,var2){
  
  a <- data %>% ggplot(aes(x = .data[[var1]],y = .data[[var2]])) + 
    geom_point(alpha=0.2,size=1,color="darkblue") + 
    geom_smooth(method="lm",color="red")
  
  
  a %>% ggplotly
  
}