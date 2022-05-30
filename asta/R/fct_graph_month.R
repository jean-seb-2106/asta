#' graph_month
#'
#' Graphique pour étudier les séries avec saisonnalité
#'
#' @param serie_ts une série temporelle
#'
#' @return un graphique au format plot
#' @export
#'
#' @examples 
#' graph_month(airpass)
graph_month <-function(serie_ts){
  monthplot(serie_ts,cex.main = 1,ylab = "",col='dodgerblue',col.base = 'indianred',lwd.base = 3)
}
