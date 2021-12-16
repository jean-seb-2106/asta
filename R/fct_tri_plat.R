#' tri_plat 
#'
#' @description Fonction qui permet de produire un tri a plat sur une qualitative
#' 
#' @param dt un dataframe
#' @param selectinput une variable qualitative
#' @importFrom questionr freq
#'
#' @return un dataframe
#'
#' @export
#' 
#' @examples
#' tri_plat(grandile,"LIB_PCS")
#' 
tri_plat <- function(dt,selectinput){
  freq(dt[,selectinput],total=TRUE,valid=FALSE,digits=2) %>% 
    rename(Effectifs = n,`Part (en %)` = `%`)
}