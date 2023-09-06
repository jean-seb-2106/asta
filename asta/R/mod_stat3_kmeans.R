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

          sliderInput(
            ns("dimensions"),
            "Choisissez le nombre de dimensions de l'ACP que vous souhaitez conserver",
            min = 2,
            max = 6,
            value = 4
          ),
          sliderInput(
            ns("classes"),
            "Choisissez le nombre de classes",
            min = 1,
            max = 9,
            value = 3
          ),
         
          sliderInput(ns("dim1"), label = "Choisissez un axe entre 1 et 6", value = "1", step = 1, min = 1, max = 6),
          
          sliderInput(ns("dim2"), label = "Choisissez un axe entre 1 et 6", value =  "2", step = 1, min = 1, max = 6),



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
          tags$p("Source : CEFIL", style = "font-size : 90%; font-style : italic; text-align : right;")
        ),
        infoBox(
          title = tags$p("Ratio Inertie inter-groupe/Inertie totale", style = "font-size : 80%;"),
          value = textOutput(ns("ratio_inertie")),
          icon = icon("chart-line"),
          #fill = TRUE,
          color="blue",
          width = NULL
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
 
    local <- reactiveValues(dt = NULL, 
                            axes = NULL,
                            classes = NULL,
                            axe1 = NULL,
                            axe2 = NULL,
                            axesfacto = NULL,
                            reskmeans = NULL)

    observeEvent(input$go, {
      local$dt <- global$data
      local$axes <- input$dimensions
      local$classes <- input$classes
      local$axe1 <- input$dim1
      local$axe2 <- input$dim2
      local$axesfacto <- PCA(local$dt, 
                             graph=FALSE, 
                             ncp=local$axes, 
                             quali.sup="GR_REG")$ind$coord
      local$reskmeans <- kmeans(local$axesfacto, 
                                centers=local$classes, 
                                nstart=1)
     
      
    })
    
    
    
   
    
    output$plot1 <- renderPlot({
      
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      fviz_cluster(local$reskmeans, 
                   data = local$axesfacto, 
                   stand=FALSE, 
                   ellipse.type = "convex", 
                   repel=FALSE, 
                   axes=c(local$axe1,local$axe2), 
                   labelsize=8)
     
    })
    
    output$ratio_inertie <- renderText({
      req(local$dt)
      x <- local$reskmeans$betweenss/local$reskmeans$totss
      format_box(x)
    })
  
    
  })
}
    
## To be copied in the UI
# mod_stat3_kmeans_ui("stat3_kmeans_1")
    
## To be copied in the server
# mod_stat3_kmeans_server("stat3_kmeans_1")
