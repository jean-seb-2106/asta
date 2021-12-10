#' stat2_pond_coher UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_coher_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemg",
          h2("controles coherence interne"))
  
}
    
#' stat2_pond_coher Server Functions
#'
#' @noRd 
mod_stat2_pond_coher_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_pond_coher_ui("stat2_pond_coher")
    
## To be copied in the server
# mod_stat2_pond_coher_server("stat2_pond_coher")
