#' stat1_inf_simulations UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_simulations_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem9",
          h2("Simulation de tirages d'\u00e9chantillons"),
          tags$br(),
          
          fluidRow(
            
            column(4,
                   wellPanel(col="red",
                     
                     
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = LETTERS),
                     sliderInput(ns("slide1"),
                                 "Choisissez la taille de l'\u00e9chantillon :",
                                 min = 1,
                                 max = 5418,
                                 value = 1000),
                     sliderInput(ns("slide2"),
                                 "Choisissez le nombre d'\u00e9chantillons :",
                                 min = 1,
                                 max = 10000,
                                 value = 1000),
                     actionButton(ns("go1"), "Lancez la simulation" )
                   )
                   
                   
            ),
            
            
            column(8,
                   
                   plotlyOutput(ns("plotly1"))
                   
            )
            
          )
          
          
          )
  
  
}
    
#' stat1_inf_simulations Server Functions
#'
#' @noRd 
mod_stat1_inf_simulations_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$plotly1 <- renderPlotly({
      
      random_ggplotly()
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_simulations_ui("stat1_inf_simulations")
    
## To be copied in the server
# mod_stat1_inf_simulations_server("stat1_inf_simulations")
