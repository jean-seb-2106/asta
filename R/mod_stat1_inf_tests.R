#' stat1_inf_tests UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_tests_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem11",
          h2("Tests statistiques"),
          
          fluidRow(
            
            column(4,
                   wellPanel(
                     
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = LETTERS),
                     
                     sliderInput(ns("slide1"),
                                 "Choisissez la taille de l'\u00e9chantillon :",
                                 min = 1,
                                 max = 5418,
                                 value = 1000),
                     
                     checkboxGroupInput(ns("check1"),
                                        "Choisissez un niveau de confiance :",
                                        choices = c("90 %","95 %","99 %")
                     ),
                     actionButton(ns("go1"), 
                                  "Lancez le test" )
                   )
                   
                   
            ),
            
            
            column(4,
                   
                   infoBox(
                     title = "Valeur estim\u00e9e",
                     value = textOutput(ns("estime")),
                     subtitle = "l'estimateur utilis\u00e9 est la moyenne empirique",
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   ),
                   
                   infoBox(
                     title = "P-VALUE",
                     value = textOutput(ns("pvalue")),
                     # subtitle = "Borne inf\u00e9rieure",
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   ),
                   
                   infoBox(
                     title = "R\u00e9sultat du test",
                     value = textOutput(ns("resultat")),
                     # subtitle = "Borne sup\u00e9rieure",
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   )
            ),
            
            
            column(4,
                   
                   
            )
            
            
          )
          
          
          
          
          
          )
  
  
  
  
  
  
}
    
#' stat1_inf_tests Server Functions
#'
#' @noRd 
mod_stat1_inf_tests_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$pvalue <- renderText({
      
      "10"
      
    })
    
    output$resultat <- renderText({
      
      "10"
      
    })
    
    output$estime <- renderText({
      
      "10"
      
    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_tests_ui("stat1_inf_tests")
    
## To be copied in the server
# mod_stat1_inf_tests_server("stat1_inf_tests")
