#' stat1_inf_estimations UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_estimations_ui <- function(id){
  ns <- NS(id)
 
  
  tabItem(tabName = "subitem8",
          h2("Estimations"))
  
}
    
#' stat1_inf_estimations Server Functions
#'
#' @noRd 
mod_stat1_inf_estimations_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat1_inf_estimations_ui("stat1_inf_estimations")
    
## To be copied in the server
# mod_stat1_inf_estimations_server("stat1_inf_estimations")
