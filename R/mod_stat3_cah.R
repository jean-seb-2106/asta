#' stat3_cah UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat3_cah_ui <- function(id) {
  ns <- NS(id)
  tagList(tabItem(
    tabName = "cah",
    h2("Classification Ascendante Hiérarchique"),
    fluidRow(
      tags$style("background-color : #E3F2FD;"),
      column(
        4,
        
        wellPanel(
          tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
          sliderInput(
            ns("classes"),
            "Choisissez le nombre de classes",
            min = 1,
            max = 9,
            value = 3
          ),
          
          
          
          actionButton(inputId = ns("go"), "Mettre \u00e0 jour")
        )
      ),
      
      
      column(
        8,
        
        
        wellPanel(
          tags$p("Plan Factoriel", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
          ,
          plotOutput(ns("facto")),
          br(),
          
          br(),
          tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
        )
      )
    ) ,
    
    fluidRow(
      tags$style("background-color : #E3F2FD;"),
      column(
        4,
        
        wellPanel(
          tags$p("Arbre hiérarchique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
          
          plotOutput(ns("arbre")),
          br(),
          tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
        )
      ),
      
      
      
      
      column(
        8,
        
        wellPanel(
          tags$p("Description des classes", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
          DTOutput(ns("tab_classes")),
          br(),
          tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
        )
      )
      
      
    )
    
  ))
}
    
#' stat3_cah Server Functions
#'
#' @noRd 
mod_stat3_cah_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    local <- reactiveValues(dt = NULL, classes = NULL )
    global <- reactiveValues(dt = state)
    
    observeEvent(input$go, {
      local$dt <- global$dt
      local$classes <- input$classes
   
      
    })
    
    
    output$tab_classes <- renderDT({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      shinipsum::random_DT(nrow = 25, ncol = 4)
      
    })
    
    
    output$arbre <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
        shinipsum::random_ggplot(type = "random")
      
    })
    
    
    output$facto <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      shinipsum::random_ggplot(type = "random")
      
    })
  })
}
    
## To be copied in the UI
# mod_stat3_cah_ui("stat3_cah_1")
    
## To be copied in the server
# mod_stat3_cah_server("stat3_cah_1")
