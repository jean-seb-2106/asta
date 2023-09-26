#' stat6_classif_donnees UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_donnees_ui <- function(id){
  ns <- NS(id)

    
    tabItem(
      tabName = "subitem__1",
      h2("Les données"),
      fluidRow(
        
        
        column(3,
                      
                      wellPanel(
                        
                        tags$p("Paramètres", 
                               style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                        
                        selectInput(inputId = ns("select1"),
                                    label = "Choississez une base de données",
                                    choices = c("vins","grandile")),
                        
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
               
               tags$p("Visualisation de la base", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               DTOutput(ns("dt1"))
               
             ) 
             
      )
      
      )
      
      
      
      
    )
    
    
 
  
}
    
#' stat6_classif_donnees Server Functions
#'
#' @noRd 
mod_stat6_classif_donnees_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
    
    output$dt1 <- renderDT({
      
      shinipsum::random_DT(nrow = 10,ncol = 10)
      
    })
    
    output$txt1 <- renderText(
      
      shinipsum::random_text(nwords = 100)
    )
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_donnees_ui("stat6_classif_donnees")
    
## To be copied in the server
# mod_stat6_classif_donnees_server("stat6_classif_donnees")
