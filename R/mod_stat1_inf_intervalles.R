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
                     
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = LETTERS),
                     
                     sliderInput(ns("slide1"),
                                 "Choisissez la taille de l'\u00e9chantillon :",
                                 min = 1,
                                 max = 5418,
                                 value = 1000),
                     
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
                            subtitle = "Borne inf\u00e9rieure",
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
                          ),
                          infoBox(
                            title = "Intervalle de confiance",
                            value = textOutput(ns("bornesup")),
                            subtitle = "Borne sup\u00e9rieure",
                            icon = icon("chart-line"),
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
                     icon = icon("chart-line"),
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
 
    
    # local <- reactiveValues(dt = NULL,echant = NULL,taille_echant = NULL,select=NULL)
    # 
    # observeEvent(input$go1,{
    #   
    #   local$dt <- global$dt
    #   local$taille_echant <- input$slide1
    #   local$echant <- local$dt %>% sample_n(local$taille_echant)
    #   local$select <- input$select1
    #   
    # })
    
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
