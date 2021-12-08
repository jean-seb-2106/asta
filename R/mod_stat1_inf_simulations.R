#' stat1_inf_simulations UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_simulations_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem9",
          h2("Simulation de tirages d'echantillons"))
  
  
}
    
#' stat1_inf_simulations Server Functions
#'
#' @noRd 
mod_stat1_inf_simulations_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat1_inf_simulations_ui("stat1_inf_simulations")
    
## To be copied in the server
# mod_stat1_inf_simulations_server("stat1_inf_simulations")
