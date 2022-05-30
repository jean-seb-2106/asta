#' dygraph_ts
#'
#' Chronogramme d'une série temporelle avec dygraph
#'
#' @param serie_ts une série temporelle
#'
#' @return un graphique dygraph
#' @export
#'
#' @examples 
#' dygraph_ts(airpass)
dygraph_ts <- function(serie_ts){
  dygraph(serie_ts) %>% dyRangeSelector()
}
