#' stat5_desaisonnalisation_mm UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat5_desaisonnalisation_mm_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem_4",
    h2("Avec moyennes mobiles"),
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
                 label = "Cliquez pour afficher"
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
      
      
      
    )
    
    
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat5_desaisonnalisation_mm Server Functions
#'
#' @noRd 
mod_stat5_desaisonnalisation_mm_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat5_desaisonnalisation_mm_ui("stat5_desaisonnalisation_mm")
    
## To be copied in the server
# mod_stat5_desaisonnalisation_mm_server("stat5_desaisonnalisation_mm")
