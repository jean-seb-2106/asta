#' stat5_analyse_visualisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom dygraphs renderDygraph dygraphOutput dygraph
mod_stat5_analyse_visualisation_ui <- function(id){
  ns <- NS(id)
  
 
    
    tabItem(tabName = "subitem_1",
            h2("Visualisation de la s\u00e9rie"),
            br(),
            br(),
            
            fluidRow(
              
              column(4,
                     
                     wellPanel(
                       
                       
                tags$p("Param\u00e8tres", 
                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                
                
                selectInput(
                  inputId = ns("select1"),
                  label = "Choisissez une s\u00e9rie :",
                  choices = c("Trafic a\u00e9rien"="airpass")
                  ),
                
                actionButton(
                  ns("go1"),
                  label = "Cliquez pour afficher"
                  )
                
              )
                     
                     
                     ),
              
              column(8,
                     
                     wellPanel(
                       tags$p("Graphique", 
                              style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       dygraphOutput(ns("plot1"))
                     )
                     
                     )
              
              
              
            )
    )
    
 
}
    
#' stat5_analyse_visualisation Server Functions
#'
#' @noRd 
mod_stat5_analyse_visualisation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(ts=NULL)
    
    observeEvent(input$go1,{
      local$ts <- input$select1
    })
    
    output$plot1 <- renderDygraph({
     
      validate(need(expr = !is.null(local$ts),
                    message = "Choisissez une s\u00e9rie temporelle dans le menu d\u00e9roulant et cliquez pour afficher le tableau")) 
   # plot(airpass)
      # shinipsum::random_dygraph()
     # dygraph(local$ts)
     dygraph_ts <- function(serie_ts){
       dygraph(eval(parse(text = serie_ts)))
     }
     dygraph_ts(local$ts)
       
    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat5_analyse_visualisation_ui("stat5_analyse_visualisation")
    
## To be copied in the server
# mod_stat5_analyse_visualisation_server("stat5_analyse_visualisation")
