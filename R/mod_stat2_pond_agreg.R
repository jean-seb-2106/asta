#' stat2_pond_agreg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_agreg_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemi",
          h2("controles agreges"))
  
  
}
    
#' stat2_pond_agreg Server Functions
#'
#' @noRd 
mod_stat2_pond_agreg_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_pond_agreg_ui("stat2_pond_agreg")
    
## To be copied in the server
# mod_stat2_pond_agreg_server("stat2_pond_agreg")
