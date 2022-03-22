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
             dashboardSidebar(
               br(),
               br(),
               br(),
               br(),
               br(),
               br(),
               br(),
               fluidRow(
                 href = 'https://www.cefil.fr/',
                 tags$img(
                   src = 'www/logo_cefil.jpg',
                   title = "CEFIL",
                   height = '95'
                 ) ,
                 style = "text-align: center; float:bottom;"
               )),
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
