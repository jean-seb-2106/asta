#' stat1_bi_qualiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_qualiquali_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(tabName = "subitem6",
          h2("Etude des corr\u00e9lations entre deux variables qualitatives"),
          
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
                 
                 tableOutput(ns("tab1"))        
                 
          )
          ),
          br(),
          br(),
          fluidRow(column(4,),
                   column(8,
                          
                          infoBox(
                            title = "Chi-2",
                            value = textOutput(ns("chi2")),
                            # subtitle = "Source : Grandile",
                            icon = icon("line-chart"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          ),
                          infoBox(
                            title = "V de Cramer",
                            value = textOutput(ns("vcramer")),
                            # subtitle = "Source : Grandile",
                            icon = icon("line-chart"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          )
                          
                   ))
          
          
          
          
          
          
          )
  
  
}
    
#' stat1_bi_qualiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_qualiquali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$tab1 <- renderTable({
      
      shinipsum::random_table(nrow = 10,ncol = 10)
      
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_qualiquali_ui("stat1_bi_qualiquali")
    
## To be copied in the server
# mod_stat1_bi_qualiquali_server("stat1_bi_qualiquali")
