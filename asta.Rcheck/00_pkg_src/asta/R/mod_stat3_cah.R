#' stat3_cah UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom FactoMineR PCA plot.PCA plot.HCPC HCPC
#' @importFrom factoextra fviz_dend fviz_cluster
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
          
          
          
          actionButton(inputId = ns("go"), "Mettre \u00e0 jour")
        ),
        wellPanel(
          tags$p("Gain d'inertie", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
          
          plotOutput(ns("arbre")),
          br()
        )
      ),
      
      
      column(
        8,
        
        
        wellPanel(
          
          
          tabsetPanel(type = "tabs",
          
                      tabPanel("Plan Factoriel",
                               br(),
          plotOutput(ns("facto")),
          br(),
          
          br()
        ),
      
        tabPanel("Description Classes",
      
                 br(),
          DT::DTOutput(ns("tab_classes")),
          br(),
          br()
        )
      )
      
      
    ),
    
    wellPanel(br(), plotOutput(ns("tab_ind")),
              br()
             )
    
  ))
  ))
}
    
#' stat3_cah Server Functions
#'
#' @noRd 
mod_stat3_cah_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    local <- reactiveValues(dt = NULL, 
                            dimensions = NULL,
                            classes = NULL,
                            result = NULL,#résultats de la CAH avec les axes de l'ACP
                            chevauch = NULL)
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$dimensions <- input$dimensions
      local$classes <- input$classes
      local$result <- HCPC(PCA(local$dt,graph=FALSE, ncp=local$dimensions,quali.sup="GR_REG"), 
                           nb.clust=local$classes, 
                           consol=FALSE,
                           graph=FALSE,
                           stand=TRUE
                           )
      
    })
    
    
    output$tab_classes <- renderDT({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      p <- local$result
      e <- p$data.clust[,-15] %>% #on retire la variable quali GR_REG
        group_by(clust) %>%
        summarise_all(.funs = mean) %>% 
        mutate_at(vars(Densite_pop:Tx_vols_vehicules),~round(.x,1)) %>% 
        mutate(nb_habitants = round(nb_habitants))
      row.names(e) <- paste0("Cluster ", e$clust)
      e_t <- data.table::transpose(e) #à ne pas confondre avec le transpose de purrr
      rownames(e_t) <- colnames(e)
      colnames(e_t) <- rownames(e)
      e_t <- e_t[-1,] #on enlève la première ligne avec le numéro du cluster
    })
    
    
    output$tab_ind <- renderPlot({

      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )

      fviz_dend(local$result, cex = 0.5, rect = FALSE)


        })
    
    output$arbre <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      plot.HCPC(local$result, 
                choice = "bar")
      
    })
    
    
    output$facto <- renderPlot({
      
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez le nombre de classes dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      fviz_cluster(local$result, 
                   axes = c(1,2), 
                   ellipse.type = "convex", 
                   repel=F, labelsize = 8)
      
    })
  })
}
    
## To be copied in the UI
# mod_stat3_cah_ui("stat3_cah_1")
    
## To be copied in the server
# mod_stat3_cah_server("stat3_cah_1")
