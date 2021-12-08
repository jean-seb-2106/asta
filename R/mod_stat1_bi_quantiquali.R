#' stat1_bi_quantiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquali_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem7",
          h2("Etude des corr\u00e9lations entre une variable quantitative et une qualitative"),
          
          br(),
          br(),
          fluidRow(column(4,
                          
                          wellPanel(
                            selectInput(ns("select1"),label = "Choisissez une variable :",choices = LETTERS),
                            selectInput(ns("select2"),label = "Choisissez une variable :",choices = LETTERS),
                            actionButton(ns("go1"),label = "Cliquez pour afficher")
                            
                            
                          )
                          
          ),
          
          column(8,
                 
                 plotlyOutput(ns("plotly1"))        
                 
          )
          ),
          br(),
          br(),
          
          fluidRow(column(4,),
                   column(8,
                          
                          h3("Formule de décomposition de la variance"),
                          
                          infoBox(
                            title = "Variance",
                            value = textOutput(ns("var")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          ),
                          infoBox(
                            title = "Variance Intra",
                            value = textOutput(ns("intra")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          ),
                          infoBox(
                            title = "Variance Inter",
                            value = textOutput(ns("inter")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          )
                          
                          
                          )),
          
          fluidRow(column(4,),
                   column(8,
                          
                          h3("Indicateur de liaison"),
                          infoBox(
                            title = "Rapport de corr\u00e9lation",
                            value = textOutput(ns("eta2")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          )
                          
                   ))
          
          
          
          
          
          
          
          
          
          
          
          
          )
  
  
}
    
#' stat1_bi_quantiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$plotly1 <- renderPlotly({
      
      
      shinipsum::random_ggplotly()
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquali_ui("stat1_bi_quantiquali")
    
## To be copied in the server
# mod_stat1_bi_quantiquali_server("stat1_bi_quantiquali")
