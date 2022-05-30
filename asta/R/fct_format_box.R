#' format_box
#'
#' Fonction qui met en forme une numérique pour rentrer dans une box
#' de shinidashboard
#'
#' @param num une numérique
#' @param ... des paramètres issus de format
#'
#' @return un character
#' @export
#'
#' @examples
#' moy <- mean(grandile$AGE)
#' format_box(moy)
#'
format_box <- function(num,...){
  
  a <- num
  format(a,decimal.mark = ",",
         big.mark = " ",
         justify = "centre",
         nsmall = 1,
         digits=2,...)
}
