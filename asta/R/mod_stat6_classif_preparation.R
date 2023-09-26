#' stat6_classif_preparation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_preparation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    tabName = "subitem__2",
    
    h2("Préparation ou Preprocessing"),
    
    fluidRow(
      
      column(3,
             
             wellPanel(
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               sliderInput(ns("slide1"),
                           label = "Quel part de la base voulez-vous conserver pour l'apprentissage  ?",
                           min = 70,
                           max = 99,
                           value = 80,
                           step = 5),
               actionButton(ns("go1"),label = "Afficher la base")
               
              
               
             ), 
             
             wellPanel(
               
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
             )
             
             ),
      column(9,
               wellPanel(
                 
                 tags$p("Exploration de la base d'entraînement", 
                        style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                 
                 verbatimTextOutput(ns("print1")))       
              
                      
                      ))
    
    
    
    )
  
  
}
    
#' stat6_classif_preparation Server Functions
#'
#' @noRd 
mod_stat6_classif_preparation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$print1 <- renderPrint({
      
      shinipsum::random_print()
    })
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_preparation_ui("stat6_classif_preparation")
    
## To be copied in the server
# mod_stat6_classif_preparation_server("stat6_classif_preparation")
