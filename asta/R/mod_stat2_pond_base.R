#' stat2_pond_base UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_base_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subiteme",
          h2("Visualisation du fichier"),
          DT::DTOutput(ns('dt_apur'))
          )
  
  
}
    
#' stat2_pond_base Server Functions
#'
#' @noRd 
mod_stat2_pond_base_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt_apur = grandile_apur)
    
    #les données----
    
    output$dt_apur <- renderDT({
      
      global$dt_apur[,1:9] %>% DT::datatable(class = "display")
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat2_pond_base_ui("stat2_pond_base")
    
## To be copied in the server
# mod_stat2_pond_base_server("stat2_pond_base")
