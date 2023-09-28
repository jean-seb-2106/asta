#' stat6_classif_generalisation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_generalisation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    "subitem__5",
    h2("Généralisation du modèle choisi au fichier test"),
    
    fluidRow(column(3,
                    
                    
                    wellPanel(
                      tags$p("Paramètres",
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      actionButton(ns("go1"), "Vérifier les performances du modèle")
                      
                    ),
                    wellPanel(
                      tags$p("Description",
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      textOutput(ns("text1"))
                      
                    )
                    ),
             
             column(9, 
                    
                    fluidRow(
                      
                      
                      column(6,
                             
                             wellPanel(tags$p("Table de confusion", 
                                              style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                       tableOutput(ns("tab1"))),
                             infoBox(
                               title = tags$p("Accuracy", style = "font-size : 80%;"),
                               value = textOutput(ns("accuracy")),
                               icon = icon("chart-line"),
                               color="blue",
                               width = NULL
                             ),
                             infoBox(
                               title = tags$p("Specificity", style = "font-size : 80%;"),
                               value = textOutput(ns("spec")),
                               icon = icon("chart-line"),
                               color="blue",
                               width = NULL
                             ),
                             infoBox(
                               title = tags$p("Sensibility", style = "font-size : 80%;"),
                               value = textOutput(ns("sens")),
                               icon = icon("chart-line"),
                               color="blue",
                               width = NULL
                             )
                             
                             
                      ),
                      
                      column(6,
                             
                             wellPanel(tags$p("Courbe ROC", 
                                              style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                       plotOutput(ns("plot1"))
                                       
                                       
                             ),
                             
                             infoBox(
                               title = tags$p("Aire sous la courbe", style = "font-size : 80%;"),
                               value = textOutput(ns("AUC")),
                               icon = icon("chart-line"),
                               color="blue",
                               width = NULL
                             )
                             
                             
                      )
                      
                      
                      
                    )
                    
                    
                    ))
    
    
    
    
    
    
    
  )
  
  
}
    
#' stat6_classif_generalisation Server Functions
#'
#' @noRd 
mod_stat6_classif_generalisation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    output$plot1 <- renderPlot({
      
      shinipsum::random_ggplot()
      
    })
    
    
    output$tab1 <- renderTable({
      
      shinipsum::random_table(nrow = 5,ncol = 5)
    })
    
    output$text1 <- renderText({
      shinipsum::random_text(nwords = 100)
    })
    
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_generalisation_ui("stat6_classif_generalisation")
    
## To be copied in the server
# mod_stat6_classif_generalisation_server("stat6_classif_generalisation")
