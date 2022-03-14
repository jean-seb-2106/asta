#' model_lineaireS_tab 
#'
#' Fonction qui fait tourner 
#' une regression lineaire simple et sort un tableau de resultat
#'
#' @param input_data un dataframe
#' @param var_expliquee variable quantitative
#' @param var_explicative variable quantitative
#' 
#' @importFrom stats lm as.formula
#' 
#' @return un tableau de resultat de la fontion lm()
#' @export
#' 
#' @examples model_lineaireS_tab(grandile, "REV_DISPONIBLE", "PATRIMOINE")
model_lineaireS_tab <- function(input_data, var_expliquee, var_explicative, constante){
  
  if (constante == TRUE) {
    a <- paste0(var_expliquee, "~ 0 + ", var_explicative)
    model <- lm(as.formula(a), data = input_data)
    result <- summary(model)
    result}
  else {  a <- paste0(var_expliquee, "~", var_explicative)
  model <- lm(as.formula(a), data = input_data)
  result <- summary(model)
  result}
}