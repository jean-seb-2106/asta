#' stat2_sond_grappes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_grappes_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemd",
          h2("Sondage en grappes"))
  
  
}
    
#' stat2_sond_grappes Server Functions
#'
#' @noRd 
mod_stat2_sond_grappes_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_sond_grappes_ui("stat2_sond_grappes")
    
## To be copied in the server
# mod_stat2_sond_grappes_server("stat2_sond_grappes")
