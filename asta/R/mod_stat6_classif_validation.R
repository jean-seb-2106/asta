#' stat6_classif_validation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_validation_ui <- function(id){
  ns <- NS(id)
  
  tabItem("subitem__4",
          h2("Validation du modèle"),
          
          fluidRow(
            
            
            column(3,
                   
                   
                   wellPanel(
              
              
              
              tags$p("Paramètres", 
                     style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
              
              sliderInput(ns("slide1"),"Validation croisée : nombre de folds",min=5,max=10,step=1,value = 10),
              actionButton(ns("go1"),"Evaluer les performances du modèle")
              
              
              
              ),
              
              wellPanel(
                
                tags$p("Descriptif", 
                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
                
                
                
              )
              
              
              ),
                   
                   
                   
                   
            column(9,)
            
            
            
            )
          
          
          )
  
  
}
    
#' stat6_classif_validation Server Functions
#'
#' @noRd 
mod_stat6_classif_validation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_validation_ui("stat6_classif_validation")
    
## To be copied in the server
# mod_stat6_classif_validation_server("stat6_classif_validation")
