#' stat1_bi_quantiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquali_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem7",
          h2("subitem7"))
  
  
}
    
#' stat1_bi_quantiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquali_ui("stat1_bi_quantiquali")
    
## To be copied in the server
# mod_stat1_bi_quantiquali_server("stat1_bi_quantiquali")
