#' stat6_reg_validation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_validation_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(
    
    
    tabName = "subitem__9",
    h2("Validation du modèle"), 
    
    fluidRow(
      
      
      column(3,
             
             
             wellPanel(
               
              
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               # sliderInput(ns("slide1"),"Validation croisée : nombre de folds",min=5,max=10,step=5,value = 10),
               actionButton(ns("go1"),"Evaluer les performances du modèle")
               
             ),
             
             
             wellPanel(
               
               
               tags$p("Descriptif", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               textOutput(ns("txt1"))
               
               
             )),
      
      
      column(9,
                       
                       
                       column(6,
                              
                              
                              wellPanel(
                                
                                tags$p("Indicateurs d'évaluation", 
                                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                
                                infoBox(
                                  title = tags$p("RSS", style = "font-size : 80%;"),
                                  value = textOutput(ns("rss")),
                                  icon = icon("chart-line"),
                                  color="blue",
                                  width = NULL
                                ),
                                
                                infoBox(
                                  title = tags$p("MSE", style = "font-size : 80%;"),
                                  value = textOutput(ns("mse")),
                                  icon = icon("chart-line"),
                                  color="blue",
                                  width = NULL
                                ),
                                
                                infoBox(
                                  title = tags$p("RMSE", style = "font-size : 80%;"),
                                  value = textOutput(ns("rmse")),
                                  icon = icon("chart-line"),
                                  color="blue",
                                  width = NULL
                                ), 
                                
                                infoBox(
                                  title = tags$p("Coefficient de détermination", style = "font-size : 80%;"),
                                  value = textOutput(ns("rsq")),
                                  icon = icon("chart-line"),
                                  color="blue",
                                  width = NULL
                                )
                                
                              )),
             
             
                      column(6,
                             
                             
                             wellPanel(
                               
                               
                               tags$p("Prévisions sur la base de validation", 
                                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                               
                               DTOutput(ns("dt1"))
                               
                               
                             )
                             ))
      
      
      
    )
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat6_reg_validation Server Functions
#'
#' @noRd 
mod_stat6_reg_validation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    output$txt1 <- renderText({
      shinipsum::random_text(nwords = 100)
    })
    
    
    
    output$rss <- renderText({
      shinipsum::random_text(nwords = 2)
    })
    
    output$mse <- renderText({
      shinipsum::random_text(nwords = 2)
    })
    
    output$rmse <- renderText({
      shinipsum::random_text(nwords = 2)
    })
    
    output$rsq <- renderText({
      shinipsum::random_text(nwords = 2)
    })
  
    
    output$dt1 <- renderDT({
      shinipsum::random_DT(nrow=10,ncol=4)
    })  
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_reg_validation_ui("stat6_reg_validation")
    
## To be copied in the server
# mod_stat6_reg_validation_server("stat6_reg_validation")
