#' stat2_redress_impact UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_impact_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subiteml",
          h2("redressement et impact"))
  
}
    
#' stat2_redress_impact Server Functions
#'
#' @noRd 
mod_stat2_redress_impact_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_impact_ui("stat2_redress_impact")
    
## To be copied in the server
# mod_stat2_redress_impact_server("stat2_redress_impact")
