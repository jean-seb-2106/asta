#' tableau_croise
#'
#' Fonction qui permet de produire un tableau croisé en profil ligne et colonne
#'
#'
#' @param data un dataframe
#' @param varquali1 une variable qualitative
#' @param varquali2 une variable qualitative
#' @param ligne un bolean
#' @importFrom tidyr pivot_wider
#' @importFrom questionr cramer.v lprop cprop
#' @importFrom stats chisq.test
#'
#' @return un tible
#' @export
#'
#' @examples
#' tableau_croise(grandile,"DIPL","PCS",ligne=TRUE)
tableau_croise <- function(data,varquali1,varquali2,ligne=FALSE){
  
  a <- table(data[,varquali1],data[,varquali2])
  data <- data %>% arrange(.data[[varquali1]])
  b <- paste0("LIB_",varquali1)
  
  
  if (ligne){
    
    a <- as.data.frame(lprop(a))
    
  }else{
    
    a <- as.data.frame(cprop(a))
    
  }
  a$Var1 <- c(unique(data[,b]),"Ensemble")
  a <- a %>% mutate(Freq = round(Freq,1)) %>% 
    tidyr::pivot_wider(names_from = Var2,values_from = Freq) %>% 
    rename({{varquali1}}:=Var1)
  
}
