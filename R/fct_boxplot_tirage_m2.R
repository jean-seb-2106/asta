#' boxplot_tirage_m2 
#'
#' @description A fct function that builds box plot 
#'
#' @return a graph
#' @import ggplot2
#' @import ggthemes
#' @export
#' @example boxplot_tirage_m2("Grandile.RDS", "PATRIMOINE")
boxplot_tirage_m2 <- function(data, var_plot) {
  ggplot(data) +
    geom_boxplot(aes(y = .data[[var_plot]]),  color = "blue") + scale_x_discrete() + 
    ylim (min = 9800, max = 116800) +
    labs(caption = "Source : Cefil 2021") + theme_economist()
  
}

