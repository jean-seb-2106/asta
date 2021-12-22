#' plot_apur_m2 
#'
#' @description A fct function that builds a plot with geompoints
#'
#' @return a graph
#' @import ggplot2
#' @export
#' 
#' @example plot_apur_m2("Grandile_apur.RDS", 1, 500, var_apur2 =  "SUPERF_LOG")
plot_apur_m2 <-
  function (input_data, var_apur) {
    data <- data_apur_m2(input_data, var_apur)
    ggplot(data) +
      geom_point(aes(x = numero, y = .data[[var_apur]]),) +
      theme_economist() + labs(x = NULL)
    
  }


