#' stat2_sond_2deg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_sond_2deg_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemc",
          h2("Sondage à deux degrés"),
  fluidRow(
    column(4,
           
           wellPanel(
             tags$p("Paramètres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
             sliderInput(ns("TailleEch"), 
                         "Choisissez la taille de l'échantillon",
                         min=100,
                         max=1500,
                         value=150),
             selectInput(ns("VarDegres"),"Choisissez une variable pour la selection des UP :",  choices=c("Diplome"="DIPL","PCS"="PCS", "Activite"="ACT")),
             selectInput(ns("NomVarDegres"),"Choisissez un caractère :", choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
             actionButton(ns("go"),
                          label="Lancer le tirage et les calculs")
           ),
           wellPanel("La fonction utilisée en R est la fonction",span("sample", style="color:blue"),   "présente dans R de base")
    ),
    column(4,
           
           
           infoBox(
             title = tags$p("Moyenne dans l'échantillon", style = "font-size : 80%;"),
             value = textOutput(ns("meandegres")),
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
           
           
           plotOutput(outputId = ns("plotsas1"))
           
    ),
    column(4,
           
           infoBox(
             title = tags$p("Moyenne dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("meansasmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="light-blue",
             width = NULL
           ),
           infoBox(
             title = tags$p("Ecart-Type dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("sdsasmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="light-blue",
             width = NULL
           ),
           plotOutput(outputId = ns("plotsas2"))
    ))
  )


}
    
#' stat2_sond_2deg Server Functions
#'
#' @noRd 
mod_stat2_sond_2deg_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL, var = NULL, taille = NULL, ech = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$ech <- tirage_degres_m2(input_data = global$data,
                                    taille_UP = 4,
                                    taille_tot = input$TailleEch,
                                    var_degres = input$VarDegres)
      local$var <- input$NomVarDegres
      local$taille <- input$TailleEch
      
      
      
    })
    
    output$plotsas1 <- renderPlot({
      validate(
        need(expr = !is.null(local$ech),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$ech, local$var)
    })
    
    output$plotsas2 <- renderPlot({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique")
      )
      
      boxplot_tirage_m2(local$dt, local$var)
    })
    
    output$meandegres <- renderText({
      req(local$ech)
      
      
      var <- as.numeric(local$var)
   
      local$meandegres <- mean(local$ech[, local$var],na.rm = TRUE)
       paste0(format_box(local$meandegres), " €")
    })
    
    output$sdsas <- renderText({
      req(local$ech)
      
      
      local$sdsas <- sd(local$ech[, local$var], na.rm = TRUE)
      paste0(format_box(local$sdsas), " €")
    })
    
    output$meansasmere <- renderText({
      req(local$dt)
      
      local$mean <- mean(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$mean), " €")
    })
    
    output$sdsasmere <- renderText({
      req(local$dt)
      
      local$sd <- sd(local$dt[, local$var], na.rm = TRUE)
      paste0(format_box(local$sd), " €")
    })
    
    
    
  })
} 
## To be copied in the UI
# mod_stat2_sond_2deg_ui("stat2_sond_2deg")
    
## To be copied in the server
# mod_stat2_sond_2deg_server("stat2_sond_2deg")
