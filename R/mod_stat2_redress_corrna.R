#' stat2_redress_corrna UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_corrna_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemk",
          h2("etude correlation non reponse"))
  
}
    
#' stat2_redress_corrna Server Functions
#'
#' @noRd 
mod_stat2_redress_corrna_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_corrna_ui("stat2_redress_corrna")
    
## To be copied in the server
# mod_stat2_redress_corrna_server("stat2_redress_corrna")
