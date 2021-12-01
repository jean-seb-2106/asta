#' plot_apur_m2 
#'
#' @description A fct function that builds a plot with geompoints
#'
#' @return a graph
#' @import ggplot2
#' @noRd
#' @example plot_apur_m2("Grandile_apur.RDS", 1, 500, var_apur2 =  "SUPERF_LOG")
plot_apur_m2 <-
  function (input_data,
            min_apur2,
            max_apur2,
            var_apur2) {
    ggplot(data_apur_m2(input_data,
                        min_apur2,
                        max_apur2,
                        var_apur2)) +
      geom_point(aes(x = numero, y = .data[[var_apur2]]),) +
      theme_light() + labs(x = NULL)
    
  }