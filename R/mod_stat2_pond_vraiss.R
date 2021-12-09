#' stat2_pond_vraiss UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_vraiss_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemh",
          h2("controles vraissemblance"))
  
}
    
#' stat2_pond_vraiss Server Functions
#'
#' @noRd 
mod_stat2_pond_vraiss_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_pond_vraiss_ui("stat2_pond_vraiss")
    
## To be copied in the server
# mod_stat2_pond_vraiss_server("stat2_pond_vraiss")
