#' stat5_analyse_visualisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat5_analyse_visualisation_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' stat5_analyse_visualisation Server Functions
#'
#' @noRd 
mod_stat5_analyse_visualisation_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat5_analyse_visualisation_ui("stat5_analyse_visualisation")
    
## To be copied in the server
# mod_stat5_analyse_visualisation_server("stat5_analyse_visualisation")
