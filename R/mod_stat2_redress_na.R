#' stat2_redress_na UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_na_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemj",
          h2("analyse de la non reponse"))
  
}
    
#' stat2_redress_na Server Functions
#'
#' @noRd 
mod_stat2_redress_na_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_na_ui("stat2_redress_na")
    
## To be copied in the server
# mod_stat2_redress_na_server("stat2_redress_na")
