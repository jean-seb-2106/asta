#' stat2_sond_grappes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_grappes_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemd",
          h2("Sondage en grappes"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("NomVar1"),
                                 "Choisissez une variable pour la selection des UP :", 
                                 choices=c("PCS"="PCS","Diplome"="DIPL","activite"="ACT")),
                     numericInput(ns("UP"), label = "Choisissez le nombre d'UP \u00e0 \u00e9chantillonner", min = 1, max = 4, value = 1),
                     selectInput(ns("NomVar2"),
                                 "Choisissez un caract\u00e8re :", 
                                 choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
                     actionButton(ns("go"),
                                  label="Lancer le tirage et les calculs")
                   ),
                   wellPanel("La fonction utilis\u00e9e en R est la fonction",span("sample", style="color:blue"),   "de R base pour la s\u00e9lection des unit\u00e9s primaires"
            )),
            column(4,
                   
                   
                   infoBox(
                     title = tags$p("Moyenne dans l'\u00e9chantillon", style = "font-size : 80%;"),
                     value = textOutput(ns("meangrappe")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="blue",
                     width = NULL
                   ) ,
                   infoBox(
                     title = tags$p("Ecart-Type dans l'\u00e9chantillon", style = "font-size : 80%;"),
                     value = textOutput(ns("sdgrappe")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="blue",
                     width = NULL
                   ) ,
                   
                   
                   plotOutput(outputId = ns("plotgrappe"))
                   
            ),
            column(4,
                   
                   infoBox(
                     title = tags$p("Moyenne dans la Pop. m\u00e8re", style = "font-size : 80%;"),
                     value = textOutput(ns("meanmere")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = tags$p("Ecart-Type dans la Pop. m\u00e8re", style = "font-size : 80%;"),
                     value = textOutput(ns("sdmere")),
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   plotOutput(outputId = ns("plotmere"))
            ))
  )
  
}
    
#' stat2_sond_grappes Server Functions
#'
#' @noRd 
mod_stat2_sond_grappes_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL, var = NULL, ech = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$ech <- as.data.frame(tirage_grappe_m2(global$data, input$UP, input$NomVar1))
      local$var <- input$NomVar2
     
      
      
      
    })
    
    output$plotgrappe <- renderPlot({
      validate(
        need(expr = !is.null(local$ech),
             message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$ech, local$var)
    })
    
    output$plotmere <- renderPlot({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$dt, local$var)
    })
    
    output$meangrappe <- renderText({
      req(local$dt)
      
      
      local$meangrappe <- mean(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$meangrappe), " \u20ac")
    })
    
    output$sdgrappe <- renderText({
      req(local$dt)
      
      
      local$sdgrappe <- sd(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$sdgrappe), " \u20ac")
    })
    
    output$meanmere <- renderText({
      req(local$dt)
      
      local$mean <- mean(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$mean), " \u20ac")
    })
    
    output$sdmere <- renderText({
      req(local$dt)
      
      local$sd <- sd(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$sd), " \u20ac")
    })
    
    
    
  })
}
## To be copied in the UI
# mod_stat2_sond_grappes_ui("stat2_sond_grappes")
    
## To be copied in the server
# mod_stat2_sond_grappes_server("stat2_sond_grappes")
