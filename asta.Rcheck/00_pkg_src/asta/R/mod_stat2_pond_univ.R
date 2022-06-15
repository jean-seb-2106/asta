#' stat2_pond_univ UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_univ_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemf",
          h2("Controles univari\u00e9s"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable \u00e0 contr\u00f4ler",
                                 choices = c("Superficie du jardin"="SUPERF_JARDIN", "Superficie du logement"="SUPERF_LOG")),
                     numericInput(ns("MinApur1"), "Eliminez les valeurs inf\u00e9rieures \u00e0 :", value=0),
                     
                     numericInput(ns("MaxApur1"), "Eliminez les valeurs sup\u00e9rieures \u00e0 ", value=50000),
                     tags$br(),
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats")),
                   
                   wellPanel(span("Le contr\u00f4le univari\u00e9 :", style="color:blue"),
                             " il se fait variable  par  variable. Il vise \u00e0 s'assurer que les modalit\u00e9s prises par chaque variable sont valides")
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
                   
                   wellPanel(
                     tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     
                     plotOutput(ns("nuageapur")),br(),
                     tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                     
                   )  )
            )
  )
  
  
}
    
#' stat2_pond_univ Server Functions
#'
#' @noRd 
mod_stat2_pond_univ_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt_apur = grandile_apur)
    
    local <- reactiveValues(dt = NULL, var = NULL, mean = NULL, min = NULL, max = NULL)
    
    
    observeEvent(input$go, {
     
    
      local$min <- input$MinApur1
      local$max <- input$MaxApur1
      local$var <- input$Varcontrole
      
      local$dt <- global$dt_apur %>% 
        dplyr::filter(.data[[local$var]] < local$max) %>% 
        dplyr::filter(.data[[local$var]] > local$min) %>% as.data.frame()
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
# mod_stat2_pond_univ_ui("stat2_pond_univ")
    
## To be copied in the server
# mod_stat2_pond_univ_server("stat2_pond_univ")
