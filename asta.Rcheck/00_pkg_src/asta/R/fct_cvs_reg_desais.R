#' cvs_reg_desais 
#'
#' @description Fonction qui désaisonnalise par regression linéaire
#' 
#' @param x une série temporelle
#'
#' @return une série temporelle
#' @export
#'
#' @examples 
#' x <- airpass
#' y <- log(airpass)  
#' ycvs <- cvs_reg_desais(y)
#' exp(ycvs)
cvs_reg_desais <- function(x){
  n <- length(x) #Nombre d'observations de la série temporelle
  t <- 1:n
  f <- frequency(x) #saisonnalité
  ns <- n/f #Nombre de saisons (Valeur entière)
  for (i in 1:f) {
    su <- rep(0,times=f)
    su[i] <- 1
    s <- rep(su,times=ns)
    assign(paste("s",i,sep=""),s)
    rm(s,su)
  } #création des variables explicatives s1 jusqu'à sf
  a <- paste0("x~t-1+",paste0("s",1:f,collapse = "+"))
  reg <- lm(as.formula(a)) #modèle de regression
  #récupération des coefficients issus de la regression et centrage
  a <- mean(reg$coefficients[2:(f+1)])
  b <- reg$coefficients[1]
  c <- reg$coefficients[2:(f+1)]-a
  
  #on centre les coefficients pour respecter les ordres de grandeur
  d <- paste0("c[",1:f,"]")
  e <- paste0("s",1:f)
  f <- paste0(d,"*",e,collapse = "+")
  
  #création d'un vecteur avec les coeffs
  #de desaisonnalisation
  g <- eval(parse(text = f))
  x - g
}
