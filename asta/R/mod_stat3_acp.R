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
#' @importFrom factoextra fviz_eig fviz_pca_var fviz_pca_ind
mod_stat3_acp_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "acp",
            h2("Analyse en Composantes Principales"),
            fluidRow(tags$style("background-color : #E3F2FD;"),
                     column(4,
                            
                            wellPanel(
                              tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              sliderInput(ns("dim1"), label = "Choisissez un axe entre 1 et 6", value = "1", step = 1, min = 1, max = 6),
                              
                              sliderInput(ns("dim2"), label = "Choisissez un axe entre 1 et 6", value =  "2", step = 1, min = 1, max = 6),
                              
                              checkboxInput(ns("check1"),"Chevauchement de texte"),
                              
                              checkboxInput(ns("check2"),"Variable quali supplémentaire"),
                              
                              actionButton(inputId=ns("go"),"Mettre \u00e0 jour")),
                            
                            wellPanel(
                              tags$p("Décomposition de l'inertie", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
                              ,
                              plotOutput(ns("inertie")),br(),
                             
                              br(),
                              tags$p("Source : CEFIL", style = "font-size : 90%; font-style : italic; text-align : right;"))
                     ),
                     
                     column(8,
                            
                            wellPanel(
                              tags$p("Graphe des variables", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              plotOutput(ns("variables")),br(),
                              tags$p("Source : CEFIL", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            ),wellPanel(
                              tags$p("Graphe des individus", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              plotOutput(ns("individus")),br(),
                              tags$p("Source : CEFIL", style = "font-size : 90%; font-style : italic; text-align : right;"))
                            
                            
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
    
    
    local <- reactiveValues(dt = NULL, 
                            result = NULL, 
                            dim1 = NULL, 
                            dim2 = NULL )
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$result <- PCA(local$dt,graph=FALSE, ncp = 6,quali.sup="GR_REG")
      local$dim1 <- as.numeric(input$dim1)
      local$dim2 <- as.numeric(input$dim2)
      local$chevauch <- input$check1
      
    })
    
    output$inertie <- renderPlot({
      
        validate(
          need(expr = !is.null(local$dt),
               message = "Choisissez des axes et cliquez sur 
               mettre a jour pour afficher le graphique")
        )
      
      
      fviz_eig(local$result,addlabels=TRUE)
      
    })
    
    
    output$variables <- renderPlot({
      
      # shinipsum::random_ggplot()
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
    #   dim1_num <- as.numeric(input$dim1)
    #   dim2_num <- as.numeric(input$dim2)
      # plot.PCA(local$result,axes=c(dim1_num,dim2_num),choix='var',title="Graphe des variables de l'ACP")
      fviz_pca_var(local$result, 
                   axes=c(local$dim1,local$dim2), 
                   col.var = "cos2", 
                   gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
                   repel = local$chevauch
                   )
      
      })
    
    
    
    output$individus <- renderPlot({
      
      # shinipsum::random_ggplot()
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez des axes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      # dim1_num <- as.numeric(input$dim1)
      # dim2_num <- as.numeric(input$dim2)
      # plot.PCA(local$result,axes=c(dim1_num,dim2_num),title="Graphe des individus de l'ACP")
    if(input$check2){
      fviz_pca_ind(local$result, 
                   axes=c(local$dim1,local$dim2), 
                   repel = local$chevauch, 
                   labelsize=3, 
                   habillage = "GR_REG", 
                   addEllipses = TRUE, 
                   ellipse.level=0.9)
    }else{
      fviz_pca_ind(local$result, 
                   axes=c(local$dim1,local$dim2), 
                   repel = local$chevauch, 
                   labelsize=3
                   )
    }
      
      })
    
    
  })
}
    
## To be copied in the UI
# mod_stat3_acp_ui("stat3_acp_1")
    
## To be copied in the server
# mod_stat3_acp_server("stat3_acp_1")
