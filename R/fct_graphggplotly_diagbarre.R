#' graphggplotly_diagbarre
#' 
#' Fonction qui permet de générer un diagrame en barre
#' avec une légende
#'
#' @param data un dataframe
#' @param var une variable qualitative

#' @importFrom plotly ggplotly 
#'
#' @return un plotly
#' @export
#'
#' @examples
#' graphggplotly_diagbarre(grandile,var = "PCS")
graphggplotly_diagbarre <- function(data,var){
  # a <- paste0("LIB_",var)
  b <- grandile %>% ggplot(aes(x = .data[[var]])) + 
    # geom_bar(aes(col = .data[[a]]),show.legend = FALSE) +
    geom_bar() +
    # scale_color_hue() +
    ylab(label = "Effectifs")
  b %>% ggplotly
}


