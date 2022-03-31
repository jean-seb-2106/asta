#' stat3_acp UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#' 
#' @importFrom FactoMineR PCA plot.PCA
#' @importFrom shiny NS tagList 
mod_stat3_acp_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "acp",
            h2("Analyse en Composantes Principales"),
            fluidRow(tags$style("background-color : #E3F2FD;"),
                     column(4,
                            
                            wellPanel(
                              tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              textInput(ns("dim1"), label = "Choisissez un axe entre 1 et 9", value = "1"),
                              
                              textInput(ns("dim2"), label = "Choisissez un axe entre 1 et 9", value =  "2"),
                              
                              
                              
                            
                              
                              actionButton(inputId=ns("go"),"Mettre \u00e0 jour")),
                            
                            wellPanel(
                              tags$p("Décomposition de l'inertie", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
                              ,
                              plotOutput(ns("inertie")),br(),
                             
                              br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
                     ),
                     
                     column(8,
                            
                            wellPanel(
                              tags$p("Graphe des variables", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              plotOutput(ns("variables")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            ),wellPanel(
                              tags$p("Graphe des individus", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              plotOutput(ns("individus")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
                            
                            
                     )
            )
    )
    
    
  )
}
    
#' stat3_acp Server Functions
#'
#' @noRd 
mod_stat3_acp_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    local <- reactiveValues(dt = NULL, dim1 = NULL, dim2 = NULL )
    global <- reactiveValues(dt = state)
    
    observeEvent(input$go, {
      local$dt <- global$dt
      local$result <- PCA(local$dt,graph=FALSE)
      
    })
    
    output$inertie <- renderPlot({
      
      result <- PCA(state,graph=FALSE)
      
      eig <- result[["eig"]]
      
      eig2 <- as.data.frame(eig[,2]) 
      eig2$names <- c("Dim1", "Dim2", "Dim3", "Dim4", "Dim5", "Dim6", "Dim7",  "Dim8")
      eig2 <-eig2[order(eig2$`eig[, 2]`),]
      
      barplot(main = "Pourcentage d'inertie selon la dimension",height = eig2$`eig[, 2]`, xlim = c(0, 60), names=eig2$names, col="#77b5fe", horiz=T , las=1,
      )
    })
    
    
    output$variables <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      dim1_num <- as.numeric(input$dim1)
      dim2_num <- as.numeric(input$dim2)
      plot.PCA(local$result,axes=c(dim1_num,dim2_num),choix='var',title="Graphe des variables de l'ACP")
    })
    
    
    
    output$individus <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      plot.PCA(local$result,title="Graphe des individus de l'ACP")
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat3_acp_ui("stat3_acp_1")
    
## To be copied in the server
# mod_stat3_acp_server("stat3_acp_1")
