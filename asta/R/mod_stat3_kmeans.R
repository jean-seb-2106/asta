#' stat3_kmeans UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat3_kmeans_ui <- function(id){
  ns <- NS(id)
  tagList(tabItem(
    tabName = "cah",
    h2("K-means"),
    fluidRow(
      tags$style("background-color : #E3F2FD;"),
      column(
        4,

        wellPanel(
          tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),


          selectInput(ns("xcol"), "Variable X", choices = c("Population" = "Population", "Income" = "Income","Illiteracy"="Illiteracy", "Life Exp"="Life Exp", "Murder"= "Murder") ),
          selectInput(ns("ycol"), 'Variable Y',choices = c("Population"="Population", "Income"="Income","Illiteracy"="Illiteracy", "Life Exp"="Life Exp", "Murder"= "Murder")),
          numericInput(ns("clusters"), 'Cluster count', 3, min = 1, max = 9),



          actionButton(inputId = ns("go"), "Mettre \u00e0 jour")
        ))
      ,


      column(
        8,


        wellPanel(
          tags$p("K-means clustering", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
          ,
          plotOutput(ns("plot1")),
          br(),

          br(),
          tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
        )
      )


    )
    
  ))
}
    
#' stat3_kmeans Server Functions
#'
#' @noRd 
mod_stat3_kmeans_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL, classes = NULL )
    global <- reactiveValues(dt = state)

    observeEvent(input$go, {
      local$dt <- global$dt
      local$varx <- input$xcol
      local$vary <- input$ycol
      local$clusters <- input$clusters
     
      selectedData <- function(){
        b <- local$dt
        b[, c(local$varx, local$vary)]
      }
      local$selectedData <- selectedData()
      
      clusters <- function() {
        kmeans(selectedData(), local$clusters, nstart = 5)
      }
      local$clusters <- clusters()
      
    })
    
    
    
   
    
    output$plot1 <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
     
    a <- local$clusters
    
      palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
      
      par(mar = c(5.1, 4.1, 0, 1))
      plot(local$selectedData,
           col = a$cluster,
           pch = 20, cex = 3)
      points(a$centers, pch = 4, cex = 4, lwd = 4)
    })
    
  
    
  })
}
    
## To be copied in the UI
# mod_stat3_kmeans_ui("stat3_kmeans_1")
    
## To be copied in the server
# mod_stat3_kmeans_server("stat3_kmeans_1")
