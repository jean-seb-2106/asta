#' stat6_classif_modele UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_modele_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem__3",
          
          h2("Les modèles/algorithmes"),
    
    
    
  )
  
  
}
    
#' stat6_classif_modele Server Functions
#'
#' @noRd 
mod_stat6_classif_modele_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_modele_ui("stat6_classif_modele")
    
## To be copied in the server
# mod_stat6_classif_modele_server("stat6_classif_modele")
