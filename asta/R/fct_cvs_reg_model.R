#' cvs_reg_model 
#'
#' @description Modèle de regression préalable à la désaisonnalisation
#' 
#' @param x une série temporelle
#'
#' @return un modèle de regression
#' @export
#'
#' @examples 
#' reg_airpass <- cvs_reg_model(log(airpass))
#' summary(reg_airpass)
cvs_reg_model <- function(x){
  
  n <- length(x) #Nombre d'observations de la série temporelle
  t <- 1:n #création d'une série
  f <- frequency(x) #nombre de périodes par saison
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
  reg
  
}