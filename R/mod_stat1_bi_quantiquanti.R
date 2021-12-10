#' stat1_bi_quantiquanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquanti_ui <- function(id){
  ns <- NS(id)

  tabItem(tabName = "subitem5",
          h2("Etude des corr\u00e9lations entre deux variables quantitatives"),
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
                          h3("Graphique"),        
                           plotlyOutput(ns("plotly1"))        
                                   
                                   )
                   ),
          br(),
          br(),
          fluidRow(column(4,),
                   column(8,
                          h3("Indicateur d'intensit\u00e9 de la corr\u00e9lation"),
                                     infoBox(
                                       title = "Coeff de corr\u00e9lation lin\u00e9aire",
                                       value = textOutput(ns("cor")),
                                       # subtitle = "Source : Grandile",
                                       icon = icon("line-chart"),
                                       #fill = TRUE,
                                       color="aqua",
                                       width=6
                                     )
                                     
                                     ))
          
          )
  
  
}
    
#' stat1_bi_quantiquanti Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquanti_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
 output$plotly1 <- renderPlotly({
   
   
   shinipsum::random_ggplotly()
   
 })
    

 output$cor <- renderText({
   
   "10"
   
 })
 
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquanti_ui("stat1_bi_quantiquanti")
    
## To be copied in the server
# mod_stat1_bi_quantiquanti_server("stat1_bi_quantiquanti")
