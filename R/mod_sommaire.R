#' sommaire UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sommaire_ui <- function(id){
  ns <- NS(id)
  
  tabPanel(    title = "Sommaire",
    fluidPage(
      # tags$style('.container-fluid {
      #                        background-color: #fafad2 	;
      #         }'),
  
    
    tags$h1("Programme du parcours statistique des attach\u00e9s", style = "background-color: #e7e7e7 ;"),
    tags$br(),
    h2("Stat 1 : Statistiques descriptives et inf\u00e9rentielles"),
    h2("Stat 2 : Enqu\u00eates et sondages"),
    h2("Stat 3 : Analyse exploratoire de donn\u00e9es (en construction)"),
    h2("Stat 4 : Econom\u00e9trie (en construction)"),
    h2("Stat 5 : S\u00e9ries temporelles (en construction)"),
    h2("Stat 6 : Secret statistique et Big Data (en construction)"),
    tags$br(),tags$br(),tags$br(),
    HTML('<center> <img src="www/logo_cefil.jpg" width ="80" > </center>')
   
      
    
  )
  )
}
    
#' sommaire Server Functions
#'
#' @noRd 
mod_sommaire_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sommaire_ui("sommaire_ui")
    
## To be copied in the server
# mod_sommaire_server("sommaire_ui")
