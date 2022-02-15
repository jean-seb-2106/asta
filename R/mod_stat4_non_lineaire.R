#' stat4_non_lineaire UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_non_lineaire_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "reg_nl",
            h2("R\u00e9gression non lin\u00e9aire"),
            fluidRow(
              column(6,
                     
                     wellPanel(
                       tags$p("Regression : puissance carr\u00e9e", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl1")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ),
                     wellPanel(
                       tags$p("Regression : sinus", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl2")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     )
              ),
              
              column(6,
                     wellPanel(
                       tags$p("Regression : logarithme n\u00e9p\u00e9rien", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl3")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ),
                     wellPanel(
                       tags$p("Regression : exponentiel", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl4")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ) 
              )
            )
    ))
  
}  
#' stat4_non_lineaire Server Functions
#'
#' @noRd 
mod_stat4_non_lineaire_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      
    })
  
    
    output$regnl1 <- renderPlot({
      
      shinipsum::random_ggplot(type = "random")
    })
    
    output$regnl2 <- renderPlot({
      
      shinipsum::random_ggplot(type = "random")
    })
    
    output$regnl3 <- renderPlot({
      
      shinipsum::random_ggplot(type = "random")
    })
    
    output$regnl4 <- renderPlot({
      
      shinipsum::random_ggplot(type = "random")
    })
    
  })
}
    
## To be copied in the UI
# mod_stat4_non_lineaire_ui("stat4_non_lineaire_ui_1")
    
## To be copied in the server
# mod_stat4_non_lineaire_server("stat4_non_lineaire_ui_1")
