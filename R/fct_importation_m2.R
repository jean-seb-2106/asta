#' importation_m2 
#'
#' @description A fct function that imports a file located into 'inst'
#'
#' @return a dataframe
#'
#' @noRd
#' @example file_grandile_m2("Grandile.RDS")
file_grandile_m2 <- function (input_data) {
  data_grandile_m2 <-
    readRDS(file = system.file(input_data, package = "asta"))
  data_grandile_m2
}
