#' stat6_classif_modele UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom parsnip set_engine logistic_reg fit
#' @importFrom workflows workflow add_model add_recipe
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
                                        choices = c("Régression Logistique","Arbre","Forêt aléatoire","KNN")),
                            actionButton(ns("go1"),"Ajustement du modèle")
                          
                          ),
                          
                          wellPanel(
                            
                            tags$p("Descriptif du modèle", 
                                           style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                            textOutput(ns("text1"))
                            
                            
                            )
                          
                          
                          # wellPanel(
                          #   
                          #   tags$p("Hyper-paramètres", 
                          #          style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                          #   selectInput(ns("select2"),
                          #               "Quel hyper-paramètres voulez-vous modifier ? :",
                          #               choices = NULL),
                          #   sliderInput(ns("slide1"),label = textOutput(ns("text2")),min = 1,max = 10,step = 1,value = 5),
                          #   actionButton(ns("go2"),"Mettre à jour le modèle")
                          #   
                          #   
                          #   )
                          
                          ),column(9,
                                   
                                   fluidRow(column(6,wellPanel( tags$p("Résultats du modèle", 
                                                                       style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                                                verbatimTextOutput(ns("print1"))
                                                                
                                                                
                                   )),column(6,wellPanel(tags$p("Prévisions", 
                                                                style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                                         DTOutput(ns("dt1")))))
                                   
                                   
                                   
                                  
                                   
                                   ))
    
    
    
  )
  
  
}
    
#' stat6_classif_modele Server Functions
#'
#' @noRd 
mod_stat6_classif_modele_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    local <- reactiveValues(dt = NULL,
                            rec=NULL,
                            mod = NULL,
                            wflow = NULL)
    
    observeEvent("go1",{
      local$dt <- global$dt_train_valid
      local$rec <- global$rec #importation de la recette de l'étape précédente
      if(input$select1 == "Régression Logistique"){
        local$mod <- logistic_reg() %>% 
          set_engine("glm")
      }
      # local$wflow <- workflow() %>% 
      #   add_model(local$mod) %>% 
      #   add_recipe(local$rec)
      # local$fit <- local$wflow %>% fit(local$dt)
    })
    
    output$text1 <- renderText({
      
      shinipsum::random_text(nwords = 100)
      
    })
    
    # output$text2 <- renderText({
    #   
    #   "?"
    #   
    # })
    # 
    
    output$print1 <- renderPrint({
      
      req(local$dt)
      
      local$fit
      
      # shinipsum::random_print(type = "model")
      
    })
    
    
    output$dt1 <- renderDT({
      shinipsum::random_DT(nrow = 10,ncol = 4)
      
    })
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_modele_ui("stat6_classif_modele")
    
## To be copied in the server
# mod_stat6_classif_modele_server("stat6_classif_modele")
