#' dygraph_ts
#'
#' Chronogramme d'une série temporelle avec dygraph
#'
#' @param serie_ts une chaîne de caractère
#'
#' @return un graphique dygraph
#' @export
#'
#' @examples 
#' dygraph_ts("airpass")
dygraph_ts <- function(serie_ts){
  dygraph(eval(parse(text = serie_ts))) %>% dyRangeSelector()
}
