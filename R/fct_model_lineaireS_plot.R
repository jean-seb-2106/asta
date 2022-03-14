#' model_lineaireS_plot 
#'
#' @description FOnction qui trace le nuage de point et la droite de regression lineaire
#' 
#' @param input_data un dataframe
#' @param var_expliquee une variable quantitative
#' @param var_explicative une variable quantitative
#' 
#' @importFrom magrittr %>% 
#' @import ggplot2
#'
#' @return un graphique ggplot
#' @export
#'
#' @examples model_lineaireS_plot(grandile, "REV_DISPONIBLE", "PATRIMOINE")
#' 
model_lineaireS_plot <- function(input_data, var_expliquee, var_explicative, constante){
  
  if (constante == TRUE) { a <- paste0(var_expliquee, "~ 0 + ", var_explicative)
  model <- lm(as.formula(a), data = input_data)
  result <- summary(model)
  
  a <- input_data %>% ggplot(aes(x = .data[[var_explicative]],y = .data[[var_expliquee]])) + 
    geom_point(alpha=0.2,size=1,color="darkblue") + 
    theme_minimal() 
  
  
  coeff=coefficients(model)
  a + geom_abline(intercept = 0, slope = coeff[1], colour="red")}
  
  else {
    
    a <- paste0(var_expliquee, "~", var_explicative)
    model <- lm(as.formula(a), data = input_data)
    result <- summary(model)
    
    a <- input_data %>% ggplot(aes(x = .data[[var_explicative]],y = .data[[var_expliquee]])) + 
      geom_point(alpha=0.2,size=1,color="darkblue") + 
      theme_minimal() 
    
    
    coeff=coefficients(model)
    a + geom_abline(intercept = coeff[1], slope = coeff[2], colour="red")}
}