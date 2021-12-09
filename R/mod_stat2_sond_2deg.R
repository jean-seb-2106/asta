#' stat2_sond_2deg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_2deg_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemc",
          h2("Sondage à deux degrés"))
  
  
}
    
#' stat2_sond_2deg Server Functions
#'
#' @noRd 
mod_stat2_sond_2deg_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_sond_2deg_ui("stat2_sond_2deg")
    
## To be copied in the server
# mod_stat2_sond_2deg_server("stat2_sond_2deg")
