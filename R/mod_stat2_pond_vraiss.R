#' stat2_pond_vraiss UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_vraiss_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemh",
          h2("Contr\u00f4les de vraissemblance"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez la variable \u00e0 contr\u00f4ler",
                                 choices = c("Superficie par pi\u00e8ce"="SUPERF_PAR_PIECE", "Superficie par personne"="SUPERF_PAR_PERSONNE")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats")),
                   
                   wellPanel(span("Le contr\u00f4le de vraisemblance :", style="color:blue"),
                             " il fait intervenir plusieurs variables simultan\u00e9ment toujours sous forme de ratios (moyenne, part etc.). Il permet de v\u00e9rifier la pertinence du ratio selon des bornes acceptables \u00e9tablies en fonction de la connaissance qu'on a du domaine.")
            ),
            column(4,
                   
                   
                   infoBox(
                     title = tags$p("Moyenne", style = "font-size : 80%;"),
                     value = textOutput(ns("mean")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="blue",
                     width = NULL
                   ) ,
                   infoBox(
                     title = tags$p("Ecart-Type", style = "font-size : 80%;"),
                     value = textOutput(ns("sd")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="blue",
                     width = NULL
                   ) 
                   
            ),
            column(4,
                   
                   infoBox(
                     title = tags$p("Minimum", style = "font-size : 80%;"),
                     value = textOutput(ns("min")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = tags$p("Maximum", style = "font-size : 80%;"),
                     value = textOutput(ns("max")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   )
            ),
            
            
            
            column(width=8,
                   
                   box(title = "Repartition",
                       footer = "Source : Cefil 2021",
                       status = "primary", #style de la boite parmi c("primary","warning","info")
                       solidHeader = TRUE, #met un fond de couleur au titre
                       #background = "aqua",
                       width = NULL, #largeur entre 1 et 12
                       plotOutput(ns("nuageapur"))
                   )  )
          )
  )
  
  
}
    
#' stat2_pond_vraiss Server Functions
#'
#' @noRd 
mod_stat2_pond_vraiss_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    global <- reactiveValues(dt_apur = grandile_apur)
    
    local <- reactiveValues(dt = NULL, var = NULL, mean = NULL, min = NULL, max = NULL)
    
    
    observeEvent(input$go, {
      
      
      local$min <- input$MinApur1
      local$max <- input$MaxApur1
      local$var <- input$Varcontrole
      
      local$dt <- global$dt_apur %>%  as.data.frame()
    }) 
    
    
    output$mean <- renderText({
      req(local$dt)
      
      
      local$mean <- mean(local$dt[, local$var], na.rm = TRUE)
      paste0(round(local$mean), " m2")
    })
    
    output$min <- renderText({
      req(local$dt)
      
      
      local$min <- min(local$dt[, local$var], na.rm = TRUE)
      paste0(round(local$min), " m2")
    })
    
    output$max <- renderText({
      req(local$dt)
      
      
      local$max <- max(local$dt[, local$var], na.rm = TRUE)
      paste0(round(local$max), " m2")
    })
    
    
    output$sd <- renderText({
      req(local$dt)
      
      
      local$sd <- sd(local$dt[, local$var], na.rm = TRUE)
      paste0(round(local$sd), " m2")
    })
    
    output$nuageapur <- renderPlot(
      {
        validate(
          need(expr = !is.null(local$dt),
               message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
        )
        
        plot_apur_m2(input_data = local$dt, var_apur = local$var)
        
      }
      
    )
    
  })
} 
## To be copied in the UI
# mod_stat2_pond_vraiss_ui("stat2_pond_vraiss")
    
## To be copied in the server
# mod_stat2_pond_vraiss_server("stat2_pond_vraiss")
