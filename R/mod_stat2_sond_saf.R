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
             
             sliderInput(ns("TailleEch"), 
                         "Choisissez la taille de l'échantillon",
                         min=10,
                         max=5418,
                         value=15),
             selectInput(ns("NomVar1"),
                         "Choisissez une variable de stratification :", 
                         choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
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
           
           
           plotOutput(outputId = ns("plotsas1"))
           
    ),
    column(4,
           
           infoBox(
             title = tags$p("Moyenne dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("meansasmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="blue",
             width = NULL
           ),
           infoBox(
             title = tags$p("Ecart-Type dans la Pop. mère", style = "font-size : 80%;"),
             value = textOutput(ns("sdsasmere")),
             icon = icon("line-chart"),
             #fill = TRUE,
             color="blue",
             width = NULL
           ),
           plotOutput(outputId = ns("plotsas2"))
    ))
  )
  
}
    
#' stat2_sond_saf Server Functions
#'
#' @noRd 
mod_stat2_sond_saf_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_sond_saf_ui("stat2_sond_saf")
    
## To be copied in the server
# mod_stat2_sond_saf_server("stat2_sond_saf")
