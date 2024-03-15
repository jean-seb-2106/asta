#' stat6_reg_donnees UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_donnees_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(
    
    
    tabName = "subitem__6",
          h2("Les données"),
    
    fluidRow(
      
      
      
      
      
      column(3,
             
             wellPanel(
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               selectInput(inputId = ns("select1"),
                           label = "Choississez une base de données",
                           choices = c("ozone","grandile")),
               
               actionButton(ns("go1"),label = "Affichez la base")
               
             ),
             
             
             
             
             wellPanel(
               
               tags$p("Description de la base de données", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               textOutput(ns("txt1"))
               
             )
             
             
             
      ),
      
      column(9, 
             
             wellPanel(
               
               tags$p("Exploration de la base", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               verbatimTextOutput(ns("print1"))
               
             ) 
             
      )
      
      
      
      
    )
    
          
          
          
          
          
          
          )
  
  
  
}
    
#' stat6_reg_donnees Server Functions
#'
#' @noRd 
mod_stat6_reg_donnees_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    output$print1 <- renderPrint({

      shinipsum::random_print(type = "table")
            
      # req(local$dt)
      # 
      # skim(local$dt)
      
    })
    
    
    output$txt1 <- renderText({
      
      # req(local$dt)
      # local$descriptif
      
      shinipsum::random_text(nwords = 100)
    })
    
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat6_reg_donnees_ui("stat6_reg_donnees")
    
## To be copied in the server
# mod_stat6_reg_donnees_server("stat6_reg_donnees")
