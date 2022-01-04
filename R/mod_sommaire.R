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
  
  tabPanel(
    title = "Sommaire",
    
    h1("Stat 1 : Statistiques descriptives et inf\u00e9rentielles"),
    h1("Stat 2 : Enqu\u00eates et sondages"),
    h1("Stat 3 : Analyse exploratoire de donn\u00e9es"),
    h1("Stat 4 : Econom\u00e9trie"),
    h1("Stat 5 : S\u00e9ries temporelles"),
    h1("Stat 6 : Secret statistique et Big Data")
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
