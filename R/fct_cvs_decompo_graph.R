#' cvs_decompo_graph
#'
#' Graphique de décomposition d'une série temporelle
#'
#' @param x une série temporelle
#' @param ... arguments hérités de la fonction decompose
#'
#' @return un graphique plot
#' @export
#'
#' @examples 
#' cvs_decompo_graph(airpass,type="multiplicative")
cvs_decompo_graph <- function(x,...){
  decomp.x <- decompose(x,...)
  plot(decomp.x)
}
