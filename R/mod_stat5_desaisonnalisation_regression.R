#' stat5_desaisonnalisation_regression UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom stats frequency 
mod_stat5_desaisonnalisation_regression_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem_3",
    h2("Désaisonnaliser avec une regression linéaire "),
    br(),
    br(),
    
    fluidRow(
      
      column(4,
             
             wellPanel(
               
               
               tags$p("Param\u00e8tres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               
               selectInput(
                 inputId = ns("select1"),
                 label = "Choisissez une s\u00e9rie :",
                 choices = c("Trafic a\u00e9rien"="airpass",
                             "Fr\u00e9quentation hoteliere"="hotel")
               ),
               
               checkboxInput(inputId = ns("check1"),
                             label = "Appliquez le logarithme",
                             value = FALSE),
               
               actionButton(
                 ns("go1"),
                 label = "Cliquez pour désaisonnaliser"
               )
               
               
               
             )
             
             
      ),
      
      column(8,
             
             wellPanel(
               tags$p("Graphique", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               plotOutput(ns("plot1"))
             )
             
      )
      
      
      
    ),
    
    
    fluidRow(column(4,),column(8,
                               
                               
                               tags$p("Résultat du modèle - sortie R", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                               verbatimTextOutput(ns("tab1")),br(),
                               tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                               
    ))
    
    
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat5_desaisonnalisation_regression Server Functions
#'
#' @noRd 
mod_stat5_desaisonnalisation_regression_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat5_desaisonnalisation_regression_ui("stat5_desaisonnalisation_regression")
    
## To be copied in the server
# mod_stat5_desaisonnalisation_regression_server("stat5_desaisonnalisation_regression")
