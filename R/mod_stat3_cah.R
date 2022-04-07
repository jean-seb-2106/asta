#' stat3_cah UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom FactoMineR PCA plot.PCA plot.HCPC HCPC
#' @importFrom shiny NS tagList 
#' @importFrom data.table transpose
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
            ns("dimensions"),
            "Choisissez le nombre de dimensions de l'ACP que vous souhaitez conserver",
            min = 1,
            max = 9,
            value = 4
          ),
          sliderInput(
            ns("classes"),
            "Choisissez le nombre de classes",
            min = 1,
            max = 9,
            value = 3
          ),
          
          
          
          actionButton(inputId = ns("go"), "Mettre \u00e0 jour")
        ),
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
          tags$p("Plan Factoriel", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
          ,
          plotOutput(ns("facto")),
          br(),
          
          br(),
          tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
        ),
      
      
        wellPanel(
          tags$p("Description des classes", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
          DT::DTOutput(ns("tab_classes")),
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
      local$dimensions <- input$dimensions
      local$classes <- input$classes
      local$result <- HCPC(PCA(local$dt,graph=FALSE), nb.clust=local$classes, consol=FALSE,graph=FALSE,nb.par=local$dimensions)
      
    })
    
    
    output$tab_classes <- renderDT({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      p <- local$result
      e <- p$data.clust %>% group_by(clust) %>% summarise(Population_moyenne=round(mean(Population)), Revenu_percapita=round(mean(Income)), Taux_illetrisme_pourcent =round(mean(Illiteracy),1),
                                                          Esperance_vie=round(mean(`Life Exp`)), Taux_meurtres_pourcentmille=round(mean(Murder),1), Part_diplomes_sup=round(mean(`HS Grad`),1),
                                                          Nb_jours_gel=round(mean(Frost)), Superficie_squaremiles=round(mean(Area)))
      row.names(e) <- paste0("Cluster ", e$clust)
      
      
      
      e_t <- transpose(e)
      rownames(e_t) <- colnames(e)
      colnames(e_t) <- rownames(e)
      e_t <- e_t[-1,]
    })
    
    
    output$arbre <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      plot.HCPC(local$result,choice='tree',title='Arbre hiérarchique')
      
    })
    
    
    output$facto <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      plot(local$result,choice='map',draw.tree=FALSE) + xlim(-3,3)
      
    })
  })
}
    
## To be copied in the UI
# mod_stat3_cah_ui("stat3_cah_1")
    
## To be copied in the server
# mod_stat3_cah_server("stat3_cah_1")
