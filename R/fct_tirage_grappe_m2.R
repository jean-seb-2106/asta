#' Tirage_grappe_m2
#'
#' @description Une fonction de tirage en grappe
#' @param input_data un dataframe
#' @param taille_grappe la taille de la grappe
#' @param var_grappe une variable de stratification
#' @import dplyr
#'
#' @return un echantillon
#' @export
#'
#' @examples tirage_grappe_m2(grandile, 4, "DIPL")
tirage_grappe_m2 <- function (input_data, taille_grappe, var_grappe) {
  UP <-
    input_data %>% group_by(.data[[var_grappe]]) %>%
    summarise(Effectifs = n()) %>% select(.data[[var_grappe]])
  
  sond1 <-
    UP[sample(1:nrow(UP), taille_grappe), ] %>% mutate(ECH = "1")  %>%
    right_join(input_data, by = var_grappe) %>%
    filter(ECH == "1")
  
}