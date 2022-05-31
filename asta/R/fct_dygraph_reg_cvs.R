#' dygraph_reg_cvs 
#'
#' @description Fonction qui renvoie deux séries sur un dygraph
#' 
#' @param x une série temporelle
#' @param x_cvs la même série temporelle désaisonnalisée
#'
#' @return un graphique de type dygraph
#' @export
#'
#' @examples 
#' x <- airpass
#' y <- log(airpass)  
#' ycvs <- cvs_reg_desais(y)
#' xcvs <- exp(ycvs)
#' dygraph_reg_cvs(x,xcvs)
dygraph_reg_cvs <- function(x,x_cvs){
  x_brut_cvs <- cbind(x,x_cvs)
  dygraph(x_brut_cvs) %>% dyRangeSelector()
} 