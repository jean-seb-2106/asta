#' graphggplotly_qualiquanti
#'
#' fonction qui crée un nuage de points entre une qualitative
#' et une quantitative
#'
#' @param data un dataframe
#' @param varquali une variable qualitative
#' @param varquanti une variable quantitative
#'
#' @return un graphique au format ggplot
#' @export
#'
#' @examples
#' graphggplotly_qualiquanti(grandile,"PCS","REV_DISPONIBLE")
graphggplotly_qualiquanti <- function(data,varquali,varquanti){
  
  moy <- mean(data[,varquanti],na.rm = TRUE)
  a <- paste0("LIB_",varquali)
  ggplot(data) + 
    aes(x=.data[[varquali]],y=.data[[varquanti]],colour=.data[[a]])+
    geom_point(size = 1L) +
    scale_color_hue() +
    theme_minimal() +
    geom_hline(yintercept=moy,color="red",size=0.5)  +
    stat_summary(fun=mean,geom = "crossbar",size=0.5,width=0.5,show.legend = TRUE)+
    xlab(varquali)+
    ylab(varquanti)
  
}
