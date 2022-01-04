#' stat2_redress_corrna UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_corrna_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemk",
          h2("Etude corr\u00e9lation non r\u00e9ponse"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable \u00e0 \u00e9tudier",
                                 choices = c("Superficie du jardin"="SUPERF_JARDIN", "Superficie du logement"="SUPERF_LOG")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats"))
            ),
            
            column(8,
                   
                   fluidRow(
                     column(6,
                            
                            
                            infoBox(
                              title = "Nb ind.  \u00e9chantillonn\u00e9s",
                              value = "10",
                              subtitle = "Source : Cefil 2021",
                              icon = icon("chart-line"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) 
                            
                     ),
                     column(6,
                            
                            infoBox(
                              title = "Nb ind.  r\u00e9pondants",
                              value = "10",
                              subtitle = "Source : Cefil 2021",
                              icon = icon("chart-line"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                     )),
                   fluidRow(
                     
                     
                     column(width=12,
                            
                            wellPanel(
                              tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              plotOutput(ns("nuageapur")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            )  )
                   )
            )
          )
  )
  
}
    
#' stat2_redress_corrna Server Functions
#'
#' @noRd 
mod_stat2_redress_corrna_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$nuageapur <- renderPlot(
      
      {
        shinipsum::random_ggplot()
        
      }
    )
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_corrna_ui("stat2_redress_corrna")
    
## To be copied in the server
# mod_stat2_redress_corrna_server("stat2_redress_corrna")
