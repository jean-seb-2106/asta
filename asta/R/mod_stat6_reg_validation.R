#' stat6_reg_validation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_validation_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(
    
    
    tabName = "subitem__9",
    h2("Validation du modèle")
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat6_reg_validation Server Functions
#'
#' @noRd 
mod_stat6_reg_validation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_reg_validation_ui("stat6_reg_validation")
    
## To be copied in the server
# mod_stat6_reg_validation_server("stat6_reg_validation")
