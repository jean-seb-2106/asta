#' stat2_pond_base UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_base_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subiteme",
          h2("base des repondants"))
  
  
}
    
#' stat2_pond_base Server Functions
#'
#' @noRd 
mod_stat2_pond_base_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_pond_base_ui("stat2_pond_base")
    
## To be copied in the server
# mod_stat2_pond_base_server("stat2_pond_base")
