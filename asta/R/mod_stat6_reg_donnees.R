#' stat6_reg_donnees UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_donnees_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(
    
    
    tabName = "subitem__6",
          h2("Les données")
    
          
          
          
          
          
          
          )
  
  
  
}
    
#' stat6_reg_donnees Server Functions
#'
#' @noRd 
mod_stat6_reg_donnees_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat6_reg_donnees_ui("stat6_reg_donnees")
    
## To be copied in the server
# mod_stat6_reg_donnees_server("stat6_reg_donnees")
