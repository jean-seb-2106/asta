#' stat2_sond_sas UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_sas_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    tabName = "subitema",
    h2("Sondage Aleatoire Simple"),
    fluidRow(
      column(4,
             
             wellPanel(
               
               sliderInput(ns("TailleEch"), 
                           "Choisissez la taille de l'échantillon",
                           min=10,
                           max=5418,
                           value=15),
               selectInput(ns("NomVar1"),
                           "Choisissez un caractère :", 
                           choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
               actionButton(ns("go"),
                            label="Lancer le tirage et les calculs")
             ),
             wellPanel("La fonction utilisée en R est la fonction",span("sample", style="color:blue"),   "présente dans R de base")
      ),
      column(4,
             
             
             infoBox(
               title = tags$p("Moyenne dans l'échantillon", style = "font-size : 80%;"),
               value = textOutput(ns("meansas")),
               icon = icon("line-chart"),
               #fill = TRUE,
               color="blue",
               width = NULL
             ) ,
             infoBox(
               title = tags$p("Ecart-Type dans l'échantillon", style = "font-size : 80%;"),
               value = textOutput(ns("sdsas")),
               icon = icon("line-chart"),
               #fill = TRUE,
               color="blue",
               width = NULL
             ) ,
             
             
             plotOutput(outputId = ns("plotsas"))
             
      ),
      column(4,
             
             infoBox(
               title = tags$p("Moyenne dans la Pop. mère", style = "font-size : 80%;"),
               value = textOutput(ns("meanmere")),
               icon = icon("line-chart"),
               #fill = TRUE,
               color="light-blue",
               width = NULL
             ),
             infoBox(
               title = tags$p("Ecart-Type dans la Pop. mère", style = "font-size : 80%;"),
               value = textOutput(ns("sdmere")),
               icon = icon("line-chart"),
               #fill = TRUE,
               color="light-blue",
               width = NULL
             ),
             plotOutput(outputId = ns("plotmere"))
      ))
  )
  
  
}
    
#' stat2_sond_sas Server Functions
#'
#' @noRd 
mod_stat2_sond_sas_server <- function(id, global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$ech <- tirage_sas_m2(global$data, input$TailleEch)
      local$var <- input$NomVar1
      local$taille <- input$TailleEch
      
      
      
    })
    
    output$plotsas <- renderPlot({
      validate(
        need(expr = !is.null(local$ech),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$ech, local$var)
    })
    
    output$plotmere <- renderPlot({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$dt, local$var)
    })
    
    output$meansas <- renderText({
      req(local$dt)
      
      
      local$meansas <- mean(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$meansas), " €")
    })
    
    output$sdsas <- renderText({
      req(local$dt)
      
      
      local$sdsas <- sd(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$sdsas), " €")
    })
    
    output$meanmere <- renderText({
      req(local$dt)
      
      local$mean <- mean(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$mean), " €")
    })
    
    output$sdmere <- renderText({
      req(local$dt)
      
      local$sd <- sd(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$sd), " €")
    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_sond_sas_ui("stat2_sond_sas")
    
## To be copied in the server
# mod_stat2_sond_sas_server("stat2_sond_sas")
