#' stat2_sond_saf UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_saf_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemb",
          h2("Sondage aléatoire Stratifié"),
  fluidRow(
    column(4,
           
           wellPanel(
             tags$p("Paramètres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
             sliderInput(ns("TailleEch"), 
                         "Choisissez la taille de l'échantillon",
                         min=100,
                         max=2500,
                         value=150),
             selectInput(ns("NomVar1"),
                         "Choisissez une variable de stratification :", 
                         choices=c("Diplome"="DIPL","Pauvre"="PAUVRE")),
             selectInput(ns("NomVar2"),
                         "Choisissez un caractère :", 
                         choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
             actionButton(ns("go"),
                          label="Lancer le tirage et les calculs")
           ),
           wellPanel("La fonction utilisée en R est la fonction",span("strata", style="color:blue"),   "du package SAMPLING")
    ),
    column(4,
           
           
           infoBox(
             title = tags$p("Moyenne dans l'échantillon", style = "font-size : 80%;"),
             value = textOutput(ns("meansaf")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="blue",
             width = NULL
           ) ,
           infoBox(
             title = tags$p("Ecart-Type dans l'échantillon", style = "font-size : 80%;"),
             value = textOutput(ns("sdsaf")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="blue",
             width = NULL
           ) ,
           
           
           plotOutput(outputId = ns("plotsaf1"))
           
    ),
    column(4,
           
           infoBox(
             title = tags$p("Moyenne dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("meansafmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="light-blue",
             width = NULL
           ),
           infoBox(
             title = tags$p("Ecart-Type dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("sdsafmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="light-blue",
             width = NULL
           ),
           plotOutput(outputId = ns("plotsaf2"))
    ))
  )
  
}
    
#' stat2_sond_saf Server Functions
#'
#' @noRd 
mod_stat2_sond_saf_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL, var = NULL, ech = NULL, taille = NULL)
    
   
    observeEvent(input$go, {
      local$dt <- global$data
      local$ech <- tirage_strat_m2 (input_data =  global$data,
                                    taille_strat =  input$TailleEch,
                                    var_strat = input$NomVar1)
      local$var <- input$NomVar2
      local$taille <- input$TailleEch
      
      
      
    })

    output$plotsaf1 <- renderPlot({
      validate(
        need(expr = !is.null(local$ech),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )

      boxplot_tirage_m2(local$ech, local$var)
    })

    output$plotsaf2 <- renderPlot({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )

      boxplot_tirage_m2(local$dt, local$var)
    })

    output$meansaf <- renderText({
      req(local$dt)


      local$meansaf <- mean(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$meansaf), " €")
    })

    output$sdsaf <- renderText({
      req(local$dt)


      local$sdsaf <- sd(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$sdsaf), " €")
    })

    output$meansafmere <- renderText({
      req(local$dt)

      local$mean <- mean(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$mean), " €")
    })

    output$sdsafmere <- renderText({
      req(local$dt)

      local$sd <- sd(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$sd), " €")
    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_sond_saf_ui("stat2_sond_saf")
    
## To be copied in the server
# mod_stat2_sond_saf_server("stat2_sond_saf")
