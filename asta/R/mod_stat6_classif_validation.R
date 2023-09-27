#' stat6_classif_validation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_validation_ui <- function(id){
  ns <- NS(id)
  
  tabItem("subitem__4",
          h2("Validation du modèle"),
          
          fluidRow(
            
            
            column(3,
                   
                   
                   wellPanel(
              
              
              
              tags$p("Paramètres", 
                     style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
              
              sliderInput(ns("slide1"),"Validation croisée : nombre de folds",min=5,max=10,step=1,value = 10),
              actionButton(ns("go1"),"Evaluer les performances du modèle")
              
              
              
              ),
              
              wellPanel(
                
                tags$p("Descriptif", 
                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                textOutput(ns("txt1"))
                
                
                
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
                   
                   )
            
            
            
            )
          
          
          )
  
  
}
    
#' stat6_classif_validation Server Functions
#'
#' @noRd 
mod_stat6_classif_validation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$plot1 <- renderPlot({
      
      shinipsum::random_ggplot()
      
    })
    
    
    output$tab1 <- renderTable({
      
      shinipsum::random_table(nrow = 4,ncol = 4)
    })
    
    output$txt1 <- renderText({
      shinipsum::random_text(nwords = 100)
    })
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_validation_ui("stat6_classif_validation")
    
## To be copied in the server
# mod_stat6_classif_validation_server("stat6_classif_validation")
