#' tab_moyenne
#'
#' Fonction pour générer un tableau de moyenne à partir
#' d'une variable quantitative et d'une qualitative
#'
#'
#' @param data un dataframe
#' @param varquali une variable qualitative
#' @param varquanti une variable quantitative
#'
#' @return un tible
#' @export
#'
#' @examples
#' tab_moyenne(grandile,"PCS","AGE")
tab_moyenne <- function(data,varquali,varquanti){
  
  a <- mean(data[,varquanti])
  b <- paste0("LIB_",varquali)
  n <- nrow(data)
  Tab_Moy <- data %>% 
    group_by(.data[[b]]) %>% 
    summarise(Effectifs = n(),
              Moyenne = mean(.data[[varquanti]]),
              Ecart_Type = sd(.data[[varquanti]])) %>% 
    mutate(Contrib_inter = ((a-Moyenne)^2)*Effectifs/(n-1),
           Contrib_intra = (Ecart_Type)^2*Effectifs/(n-1))
  Tab_Moy
}
