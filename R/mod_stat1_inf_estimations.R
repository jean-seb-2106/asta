#' stat1_inf_estimations UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_estimations_ui <- function(id){
  ns <- NS(id)
 
  
  tabItem(tabName = "subitem8",
          h2("Estimations"),
          tags$br(),
          fluidRow(column(4,
                          wellPanel(
                            
                            
                            selectInput(ns("select1"),
                                        "Quel indicateur voulez-vous estimer ?",
                                        choices = LETTERS),
                            sliderInput(ns("slide1"),
                                        "Choisissez la taille de l'\u00e9chantillon :",
                                        min = 1,
                                        max = 5418,
                                        value = 1000),
                            actionButton(ns("go1"), "Cliquez pour tirer un \u00e9chantillion et estimer l'indicateur" )
                          )
                          
                          
                          ),
                   
                   
                   column(4,
                          
                          DTOutput(ns("dt1"))
                          
                          ),
                   
                   
                   column(4,
                                              infoBox(
                                                title = "Vraie Valeur",
                                                value = textOutput(ns("vraie")),
                                                # subtitle = "Source : Grandile",
                                                icon = icon("chart-line"),
                                                #fill = TRUE,
                                                color="aqua",
                                                width=12
                                              ),
                                              infoBox(
                                                title = "Valeur estim\u00e9e",
                                                value = textOutput(ns("estime")),
                                                subtitle = "l'estimateur utilis\u00e9 est la moyenne empirique",
                                                icon = icon("chart-line"),
                                                #fill = TRUE,
                                                color="aqua",
                                                width=12
                                              )
                                              
                                              ))
          
          
          
          )
  
}
    
#' stat1_inf_estimations Server Functions
#'
#' @noRd 
mod_stat1_inf_estimations_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$dt1 <- renderDT({
      
      shinipsum::random_DT(ncol = 3,nrow = 10)
      
    })
    
    output$vraie <- renderText({
      
      "10"
      
    })
    
    output$estime <- renderText({
      
      "10"
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_estimations_ui("stat1_inf_estimations")
    
## To be copied in the server
# mod_stat1_inf_estimations_server("stat1_inf_estimations")
