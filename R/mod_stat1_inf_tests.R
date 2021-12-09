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
                     
                     
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = LETTERS),
                     checkboxGroupInput(ns("check1"),
                                        "Choisissez un niveau de confiance :",
                                        choices = c("90 %","95 %","99 %")
                     ),
                     actionButton(ns("go1"), 
                                  "Calculez l'intervalle de confiance" )
                   )
                   
                   
            ),
            
            
            column(4,
                   
                   infoBox(
                     title = "Valeur estimée",
                     value = textOutput(ns("estime")),
                     subtitle = "l'estimateur utilisé est la moyenne empirique",
                     icon = icon("line-chart"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   ),
                   
                   infoBox(
                     title = "P-VALUE",
                     value = textOutput(ns("pvalue")),
                     # subtitle = "Borne inférieure",
                     icon = icon("line-chart"),
                     #fill = TRUE,
                     color="aqua",
                     width=12
                   ),
                   
                   infoBox(
                     title = "Résultat du test",
                     value = textOutput(ns("resultat")),
                     # subtitle = "Borne supérieure",
                     icon = icon("line-chart"),
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
