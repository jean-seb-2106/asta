#' stat1_inf_intervalles UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_intervalles_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem10",
          h2("Intervalles de confiance"),
          tags$br(),
          
          fluidRow(
            
            column(4,
                   wellPanel(
                     
                     
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = LETTERS),
                     checkboxGroupInput(ns("check1"),
                                 "Choisissez un niveau de confiance :",
                                 choices = c("90 %","95 %","99 %")
                                ),
                     actionButton(ns("go1"), 
                                  "Calculez l'intervalle de confiance" )
                   )
                   
                   
            ),
            
            
            column(4,
                   
                  
                          infoBox(
                            title = "Intervalle de confiance",
                            value = textOutput(ns("borneinf")),
                            subtitle = "Borne inférieure",
                            icon = icon("line-chart"),
                            #fill = TRUE,
                            color="aqua",
                            width=12
                          ),
                          infoBox(
                            title = "Valeur estimée",
                            value = textOutput(ns("estime")),
                            subtitle = "l'estimateur utilisé est la moyenne empirique",
                            icon = icon("line-chart"),
                            #fill = TRUE,
                            color="aqua",
                            width=12
                          ),
                          infoBox(
                            title = "Intervalle de confiance",
                            value = textOutput(ns("bornesup")),
                            subtitle = "Borne supérieure",
                            icon = icon("line-chart"),
                            #fill = TRUE,
                            color="aqua",
                            width=12
                          )
            ),
            
            
            column(4,
                   infoBox(
                     title = "Vraie Valeur",
                     value = textOutput(ns("vraie")),
                     # subtitle = "Source : Grandile",
                     icon = icon("line-chart"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   )
                   
            )
            
            
          )
          
          )
  
  
}
    
#' stat1_inf_intervalles Server Functions
#'
#' @noRd 
mod_stat1_inf_intervalles_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$vraie <- renderText({
      
      "10"
      
    })
    
    output$estime <- renderText({
      
      "10"
      
    })
    
    output$borneinf <- renderText({
      
      "10"
      
    })
    
    output$bornesup <- renderText({
      
      "10"
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_intervalles_ui("stat1_inf_intervalles")
    
## To be copied in the server
# mod_stat1_inf_intervalles_server("stat1_inf_intervalles")
