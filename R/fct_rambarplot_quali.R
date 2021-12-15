#' rambarplot_quali
#' 
#' Fonction qui crée un diagramme en barre de type rAmCharts
#' à partir d'une variable qualitative
#'
#' @param data un dataframe
#' @param var variable qualitative
#' @importFrom rAmCharts amBarplot
#' @importFrom questionr freq 
#'
#' @return un graphique ramcharts
#' @export
#'
#' @examples
#' rambarplot_quali(grandile,"LIB_PCS")
rambarplot_quali <- function(data,var){
  a <- freq(data[,var],valid = FALSE) 
  b <-rownames(a)
  c <- cbind(a,b) %>% 
    rename(Effectifs = n,Part =`%`,{{var}}:= b ) 
  rAmCharts::amBarplot(x = var,y = "Effectifs",data =c)
  
}
