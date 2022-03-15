#' model_lineaireM_tab 
#'
#' @description Fonction qui fait tourner une regression lineaire multiple et sort un tableau de resultat
#' 
#' @param input_data un dataframe
#' @param var_expliquee une variable quantitative
#' @param var_explicatives un vecteur de variables quantitatives
#' @param constante un boolean
#' 
#' @importFrom stats lm as.formula
#' 
#' @return un tableau de resultat de la fontion lm()
#' @export
#'
#' @examples model_lineaireM_tab(iris, "Petal.Length", c("Sepal.Length", "Petal.Width", "Sepal.Width"))
model_lineaireM_tab <- function(input_data, var_expliquee, var_explicatives, constante=TRUE){
 
  if (constante == TRUE) {
    a <- paste0(var_expliquee, "~ 0 + ", paste0(var_explicatives, collapse = "+"))
    model <- lm(as.formula(a), data = input_data)
    result <- summary(model)
    result
  }
   else{ 
   a <- paste0(var_expliquee, "~", paste0(var_explicatives, collapse = "+"))
  model <- lm(as.formula(a), data = input_data)
  result <- summary(model)
  result}
  
  
}