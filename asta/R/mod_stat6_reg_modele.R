#' stat6_reg_modele UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_reg_modele_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem__8",
    h2("Choix du modèle"),
    
    fluidRow(column(3,
                    
                    wellPanel(
                      
                      tags$p("Paramètres", 
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      selectInput(ns("select1"),
                                  "Choissisez un algorithme :",
                                  choices = c("Régression Linéaire","Arbre","Forêt aléatoire","SVM")),
                      actionButton(ns("go1"),"Ajustement du modèle")
                      
                    ),
                    
                    wellPanel(
                      
                      tags$p("Descriptif du modèle", 
                             style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      textOutput(ns("text1"))
                      
                      
                    )
                    
                    
                    
                    
                    ),
             column(9,
                    column(6,
                           
                           wellPanel(
                             
                             
                             
                             tags$p("Résultats du modèle sur la base d'entraînement", 
                                    style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                             verbatimTextOutput(ns("print1"))
                             
                             
                             
                             
                           )
                           
                           
                           ),
                    column(6,
                           
                           wellPanel(
                             
                             
                             tags$p("Estimations sur la base d'entraînement", 
                                    style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                             DTOutput(ns("dt1"))
                             
                             
                           )
                           
                           
                           )))
    
    
    
    
    
    
    
  )
  
  
}
    
#' stat6_reg_modele Server Functions
#'
#' @noRd 
mod_stat6_reg_modele_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    output$print1 <- renderPrint({
      
      shinipsum::random_print(type = "model")
      
      # req(local$dt)
      # 
      # skim(local$dt)
      
    })
    
    
    output$dt1 <- renderDT({
      shinipsum::random_DT(nrow = 10,ncol = 4)
      # req(local$dt)
      # ncol <- length(local$pred)
      # datatable(local$pred[,(ncol-3):ncol])#4 dernières colonnes
      # local$pred %>% select(target,starts_with(".pred"))
      
    })
    
    output$txt1 <- renderText({
      
      # req(local$dt)
      # local$descriptif
      
      shinipsum::random_text(nwords = 100)
    })
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat6_reg_modele_ui("stat6_reg_modele")
    
## To be copied in the server
# mod_stat6_reg_modele_server("stat6_reg_modele")
