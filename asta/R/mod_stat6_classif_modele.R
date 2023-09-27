#' stat6_classif_modele UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_classif_modele_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem__3",
          
          h2("Les modèles/algorithmes"),
          
          fluidRow(column(3,
                          
                          wellPanel(
                            
                            tags$p("Paramètres", 
                                   style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                            selectInput(ns("select1"),
                                        "Choissisez un algorithme :",
                                        choices = c("Regression Logistique","Arbre","Forêt aléatoire","KNN")),
                            actionButton(ns("go1"),"Ajustement du modèle")
                          
                          ),
                          
                          wellPanel(
                            
                            tags$p("Descriptif du modèle", 
                                           style = "font-size : 110%; font-weight : bold; text-decoration : underline;")),
                          
                          
                          wellPanel(
                            
                            tags$p("Hyper-paramètres", 
                                   style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                            selectInput(ns("select2"),
                                        "Quel hyper-paramètres voulez-vous modifier ? :",
                                        choices = NULL),
                            sliderInput(ns("slide1"),label = textOutput(ns("text1")),min = 1,max = 10,step = 1,value = 5),
                            actionButton(ns("go2"),"Mettre à jour le modèle")
                            
                            
                            )
                          
                          ),column(9,
                                   
                                   wellPanel( tags$p("Résultats du modèle", 
                                                     style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),verbatimTextOutput(ns("text2")))
                                   
                                  
                                   
                                   ))
    
    
    
  )
  
  
}
    
#' stat6_classif_modele Server Functions
#'
#' @noRd 
mod_stat6_classif_modele_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    output$text1 <- renderText({
      
      "Nombre d'arbres"
      
    })
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_modele_ui("stat6_classif_modele")
    
## To be copied in the server
# mod_stat6_classif_modele_server("stat6_classif_modele")
