#' stat1_inf_tests UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_tests_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem11",
          h2("Tests statistiques"))
  
}
    
#' stat1_inf_tests Server Functions
#'
#' @noRd 
mod_stat1_inf_tests_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat1_inf_tests_ui("stat1_inf_tests")
    
## To be copied in the server
# mod_stat1_inf_tests_server("stat1_inf_tests")
