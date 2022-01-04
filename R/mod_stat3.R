#' stat3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat3_ui <- function(id){
  ns <- NS(id)

  tabPanel(title = "Stat 3",
           
           dashboardPage(
             
             dashboardHeader(title = "Analyse exploratoire de donn\u00e9es"),
             dashboardSidebar(),
             dashboardBody()
             
             
             
           )
           
           )
  
  
}
    
#' stat3 Server Functions
#'
#' @noRd 
mod_stat3_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat3_ui("stat3_ui")
    
## To be copied in the server
# mod_stat3_server("stat3_ui")
