#' model_logistiqueSS_tab 
#'
#' @description Fonction qui fait tourner une regression logistique 
#' 
#' @param input_data un dataframe
#' @param var_expliquee une variable quantitative
#' @param var_explicatives un vecteur de variables quantitatives
#' @param constante un boolean
#'
#' @importFrom stats glm as.formula
#'
#' @return un model glm()
#' @export
#'
#' @examples model_logistiqueSS_tab(input_data = grandile, var_expliquee = "PAUVRE", var_explicatives = c("REV_DISPONIBLE","ACT"), constante = TRUE)
model_logistiqueSS_tab <- function(input_data, var_expliquee, var_explicatives, constante = TRUE){
  # browser()
  
  
  if (constante == TRUE) {
    a <- paste0(var_expliquee, " ~ 0 + ", paste0(var_explicatives, collapse = "+"))
    model <- glm(as.formula(a),family = binomial(link = "logit"), data = input_data, weights = d$Freq)
    model
  }
  else{ 
    a <- paste0(var_expliquee, " ~", paste0(var_explicatives, collapse = "+"))
    model <- glm(as.formula(a),family = binomial(link = "logit"), data = input_data, weights = d$Freq)
    model}
  
  
}