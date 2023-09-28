#' stat6_classif_generalisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_generalisation_ui <- function(id){
  ns <- NS(id)
  
  tabItem("subitem__5", 
          h2("Généralisation du modèle choisi au fichier test"))
  
  
}
    
#' stat6_classif_generalisation Server Functions
#'
#' @noRd 
mod_stat6_classif_generalisation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_generalisation_ui("stat6_classif_generalisation")
    
## To be copied in the server
# mod_stat6_classif_generalisation_server("stat6_classif_generalisation")
