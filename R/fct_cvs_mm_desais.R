#' cvs_mm_desais
#'
#' Désaisonnalisation avec les moyennes mobiles
#'
#' @param x une série temporelle
#' @param ... arguments hérités de la fonction decompose
#'
#' @return une serie temporelle
#' @importFrom stats filter
#' @export
#'
#' @examples 
#' cvs_mm_desais(hotel)
cvs_mm_desais <- function(x,...){
  
  m2_12 <- function(a){
    
    y <- (1/12)*stats::filter(a,c(0.5,rep(1,times=11),0.5))
    return(y)
  }
  
  m3=function(b){
    y <- (1/3)*stats::filter(b,rep(1,times=3))
    return(y)
  }
  
  if(frequency(x)==12){
    
    a <- m2_12(x) #Ce filtre permet d'estimer la tendance pure de période 12
    b <- x - a  #b correspond à la composante Saison + Bruit
    
    c <- m3(m3(b)) #Estimation des coefficients des saisonniers
    d <- c - m2_12(c) #Moyennisation pour que la somme de 12 périodes 
    #consécutives des coefficients saisonniers est égale à 0
    
  }
  
  x - d
  
}
