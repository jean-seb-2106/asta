#' stat6_reg_generalisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_generalisation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem__10",
    h2("Généralisation du modèle final"), 
    
    fluidRow(
      
      
      column(3,
             
             
             wellPanel(
               tags$p("Paramètres",
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               actionButton(ns("go1"), "Ajuster le modèle retenu")
               
             ),
             wellPanel(
               tags$p("Description",
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               textOutput(ns("txt1"))
               
             )
      ),
      
      column(9, 
             
             fluidRow(
               
               
               column(6,
                      
                      wellPanel(tags$p("Résultats du modèle", 
                                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                verbatimTextOutput(ns("print1"))),
                      
                      
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
                      
                      )
                      
                      
               ),
               
               column(6,
                      
                      wellPanel(tags$p("Prévisions sur la base de test", 
                                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                DTOutput(ns("dt1"))
                                
                                
                      )
                      
                     
                      
                      
               )
               
               
               
             )
             
             
      )
      
      
    )
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat6_reg_generalisation Server Functions
#'
#' @noRd 
mod_stat6_reg_generalisation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    output$txt1 <- renderText({
      shinipsum::random_text(nwords = 100)
    })
    
    output$print1 <- renderPrint({
      
      shinipsum::random_print(type="model")
      
      
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
# mod_stat6_reg_generalisation_ui("stat6_reg_generalisation")
    
## To be copied in the server
# mod_stat6_reg_generalisation_server("stat6_reg_generalisation")
