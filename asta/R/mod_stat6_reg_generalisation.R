#' stat6_reg_generalisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_generalisation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem__10",
    h2("Généralisation du modèle choisi")
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat6_reg_generalisation Server Functions
#'
#' @noRd 
mod_stat6_reg_generalisation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_reg_generalisation_ui("stat6_reg_generalisation")
    
## To be copied in the server
# mod_stat6_reg_generalisation_server("stat6_reg_generalisation")
