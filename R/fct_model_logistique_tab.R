#' model_logistique_tab 
#'
#' @description Fonction qui fait tourner une regression logistique et sort un tableau de resultat
#' 
#' @param input_data un dataframe
#' @param var_expliquee une variable quantitative
#' @param var_explicatives un vecteur de variables quantitatives
#' @param constante un boolean
#'
#' @importFrom stats glm as.formula
#'
#' @return un tableau de resultat de la fontion glm()
#' @export
#'
#' #' @examples model_logistiqueSS_tab(input_data = titanic, 
#' var_expliquee = "Survived", 
#' var_explicatives = c("Sex","Age"), constante = TRUE)
model_logistique_tab <- function(input_data, var_expliquee, var_explicatives, constante = TRUE){
  # browser()

  
  if (constante == TRUE) {
    a <- paste0(var_expliquee, " ~ 0 + ", paste0(var_explicatives, collapse = "+"))
    model <- glm(as.formula(a),family = binomial(link = "logit"), data = input_data, weights = input_data$Freq)
    result <- summary(model)
    result
  }
  else{ 
    a <- paste0(var_expliquee, " ~", paste0(var_explicatives, collapse = "+"))
    model <- glm(as.formula(a),family = binomial(link = "logit"), data = input_data, weights = input_data$Freq)
    result <- summary(model)
    result}
  
  
}