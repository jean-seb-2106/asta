#' stat6_reg_preparation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_preparation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem__7",
    h2("Préparation de la base"),
    
    fluidRow(
      
      
      column(3,
             
             wellPanel(
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               sliderInput(ns("slide1"),
                           label = "Quel part de la base voulez-vous conserver pour l'entraînement  ?",
                           min = 70,
                           max = 90,
                           value = 80,
                           step = 5),
               
               actionButton(ns("go1"),label = "Partitionner et explorer la base d'entraînement"),
               
               h5("Le reste de la base se répartit équitablement entre la base de validation et la base de test")
               
               
             ),
             
             
             wellPanel(
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               
               selectInput(ns("select1"),
                           label = "Quelle transformation voulez-vous appliquer ?",
                           choices = c("Centrer-réduire","Imputation avec moyenne","Retirer des variables"),
                           multiple = TRUE
                           ),
               selectInput(ns("select2"),
                           label = "Sur quelles variables ?",
                           choices = c("VAR1","VAR2","VAR3"),
                           multiple = TRUE
               ),
               actionButton(ns("go2"),label = "Cliquer pour ajouter une transformation")
               
               
               
             )
             
             
             ),
      
      
      column(9,
             
             
             column(8,
                    
                    
                    wellPanel(
                      
                      tags$p("Exploration de la base d'entraînement", 
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      
                      verbatimTextOutput(ns("print1"))) 
                    
                    
                    ),
             column(4,
                    
                    
                    wellPanel(
                      
                      tags$p("Liste des transformations", 
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      
                      verbatimTextOutput(ns("print2"))) 
                    
                    
                    )
             
             
             
             )
      
      
      
      
    )
    
    
    
    
    
    
    
  )
  
  
}
    
#' stat6_reg_preparation Server Functions
#'
#' @noRd 
mod_stat6_reg_preparation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$print1 <- renderPrint({
      
      shinipsum::random_print(type = "table")
      
      # req(local$dt)
      # 
      # skim(local$dt)
      
    })
    
    output$print2 <- renderPrint({
      
      shinipsum::random_print(type = "numeric")
      
      # req(local$dt)
      # 
      # skim(local$dt)
      
    })
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_reg_preparation_ui("stat6_reg_preparation")
    
## To be copied in the server
# mod_stat6_reg_preparation_server("stat6_reg_preparation")
