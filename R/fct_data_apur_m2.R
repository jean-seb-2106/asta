#' data_apur_m2 
#'
#' @description A fct function that cleans database from extreme values
#'
#' @return a clean data frame
#' @import dplyr
#' @noRd
#' @example data_apur_m2("Grandile_apur.RDS",100, 500, var_apur = "SUPERF_LOG")
data_apur_m2 <- function(input_data, min_apur, max_apur, var_apur) {
  apur <- file_grandile_m2(input_data) %>%
    filter(.data[[var_apur]] > min_apur) %>%
    filter(.data[[var_apur]] < max_apur) %>%
    arrange(.data[[var_apur]]) %>% mutate(numero = row_number())
}