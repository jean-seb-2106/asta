#' stat2_pond_univ UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_univ_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemf",
          h2("controles univaries"))
  
  
}
    
#' stat2_pond_univ Server Functions
#'
#' @noRd 
mod_stat2_pond_univ_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_pond_univ_ui("stat2_pond_univ")
    
## To be copied in the server
# mod_stat2_pond_univ_server("stat2_pond_univ")
