#' data_apur_m2 
#'
#' @description A fct function that cleans database from extreme values
#' @param input_data un data fram
#' @param var_apur une variable quantitative
#' 
#' @return a clean data frame
#' @import dplyr
#' @export
#' @examples data_apur_m2(grandile_apur, var_apur = "SUPERF_LOG")
data_apur_m2 <- function(input_data, var_apur) {
  apur <- input_data %>% arrange(var_apur) %>% 
    mutate(numero = row_number())
}