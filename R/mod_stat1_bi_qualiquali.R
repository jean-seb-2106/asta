#' stat1_bi_qualiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_qualiquali_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(tabName = "subitem6",
          h2("subitem6"),
          
          
          
          
          
          
          )
  
  
}
    
#' stat1_bi_qualiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_qualiquali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat1_bi_qualiquali_ui("stat1_bi_qualiquali")
    
## To be copied in the server
# mod_stat1_bi_qualiquali_server("stat1_bi_qualiquali")
