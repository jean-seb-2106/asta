#' stat1_bi_quantiquanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquanti_ui <- function(id){
  ns <- NS(id)

  tabItem(tabName = "subitem5",
          h2("subitem5"))
  
  
}
    
#' stat1_bi_quantiquanti Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquanti_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquanti_ui("stat1_bi_quantiquanti")
    
## To be copied in the server
# mod_stat1_bi_quantiquanti_server("stat1_bi_quantiquanti")
