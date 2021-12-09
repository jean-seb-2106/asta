#' stat2_sond_saf UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_saf_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemb",
          h2("Sondage aléatoire stratifié"))
  
  
}
    
#' stat2_sond_saf Server Functions
#'
#' @noRd 
mod_stat2_sond_saf_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_sond_saf_ui("stat2_sond_saf")
    
## To be copied in the server
# mod_stat2_sond_saf_server("stat2_sond_saf")
