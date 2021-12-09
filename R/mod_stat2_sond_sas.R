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
               
               sliderInput("TailleEch", 
                           "Choisissez la taille de l'échantillon",
                           min=10,
                           max=5418,
                           value=15),
               selectInput("NomVar1",
                           "Choisissez un caractère :", 
                           choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
               selectInput("NomVar2",
                           "Choisissez un caractère :", 
                           choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
               actionButton("go",
                            label="Lancer le tirage et les calculs")
             ),
             wellPanel("texte texte texte texte"),
             wellPanel("texte texte texte")
      ),
      column(4,
             
             
             valueBox(
               subtitle = "Cefil 2021" ,
               value = 150, 
               width = NULL, 
               color= "aqua") ,
             plotOutput(outputId = ns("plotsas1"))
             
      ),
      column(4,
             
             infoBox(title = "mon info box2",
                     subtitle = "Cefil 2021"
             ),
             plotOutput(outputId = ns("plotsas2"))
      )),
    
    hr(),
    fluidRow(
      wellPanel(
        h2("fluidrow")
      )
    )
  )
  
  
}
    
#' stat2_sond_sas Server Functions
#'
#' @noRd 
mod_stat2_sond_sas_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$plotsas1 <- renderPlot(
      
      {
        random_ggplot("boxplot")
      }
    )
    
    output$plotsas2 <- renderPlot(
      
      {
        random_ggplot("boxplot")
      }
    )
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_sond_sas_ui("stat2_sond_sas")
    
## To be copied in the server
# mod_stat2_sond_sas_server("stat2_sond_sas")
