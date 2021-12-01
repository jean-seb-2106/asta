#' boxplot_tirage_m2 
#'
#' @description A fct function that builds box plot 
#'
#' @return a graph
#' @import ggplot2
#' @noRd
#' @example boxplot_tirage_m2("Grandile.RDS", "PATRIMOINE")
boxplot_tirage_m2 <- function(input_data, var_plot) {
  ggplot(file_grandile_m2(input_data)) +
    geom_boxplot(aes(y = .data[[var_plot]]),  color = "blue") + scale_x_discrete() + 
    ylim (min = 9800, max = 116800) +
    labs(caption = "Source : Cefil 2021")
  
}