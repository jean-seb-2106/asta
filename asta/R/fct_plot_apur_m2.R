#' plot_apur_m2 
#'
#' @description A fct function that builds a plot with geompoints
#' @param input_data un dataframe
#' @param var_apur une variable quantitative
#'
#' @return a graph
#' @import ggplot2
#' @export
#' 
#' @examples plot_apur_m2(grandile_apur,var_apur =  "SUPERF_LOG")
plot_apur_m2 <-
  function (input_data, var_apur) {
    data <- data_apur_m2(input_data, var_apur)
    ggplot(data) +
      geom_point(aes(x = numero, y = .data[[var_apur]]),) +
      theme_economist() + labs(x = NULL)
    
  }


