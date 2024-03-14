#' stat6_reg_preparation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_preparation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem__7",
    h2("Préparation de la base")
    
    
    
    
    
    
    
  )
  
  
}
    
#' stat6_reg_preparation Server Functions
#'
#' @noRd 
mod_stat6_reg_preparation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_reg_preparation_ui("stat6_reg_preparation")
    
## To be copied in the server
# mod_stat6_reg_preparation_server("stat6_reg_preparation")
