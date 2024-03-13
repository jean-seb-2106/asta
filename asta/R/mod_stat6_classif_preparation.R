#' stat6_classif_preparation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom rsample initial_validation_split training testing validation
#' @importFrom recipes recipe bake prep step_normalize step_dummy all_numeric_predictors all_nominal_predictors
mod_stat6_classif_preparation_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    tabName = "subitem__2",
    
    h2("Préparation ou Preprocessing"),
    
    fluidRow(
      
      column(3,
             
             wellPanel(
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               sliderInput(ns("slide1"),
                           label = "Quel part de la base voulez-vous conserver pour l'entraînement  ?",
                           min = 70,
                           max = 90,
                           value = 80,
                           step = 5),
               
               actionButton(ns("go1"),label = "Explorer la base d'entraînement")
               
              
               
             ), 
             
             wellPanel(
               
               
               tags$p("Paramètres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               checkboxInput(ns("check1"),"Cochez pour centrer-r\u00e9duire les variables quantitatives"),
               checkboxInput(ns("check2"),"Cochez pour transformer les variables qualitatives en indicatrices"),
               actionButton(ns("go2"),label = "Mettre à jour la base")
             ),
            
             
             ),
      column(9,
               wellPanel(
                 
                 tags$p("Exploration de la base d'entraînement", 
                        style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                 
                 verbatimTextOutput(ns("print1")))       
              
                      
                      ))
    
    
    
    )
  
  
}
    
#' stat6_classif_preparation Server Functions
#'
#' @noRd 
mod_stat6_classif_preparation_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL,
                            dt_split =NULL,
                            dt_train = NULL,
                            dt_valid = NULL,
                            dt_test = NULL,
                            dt_train_valid = NULL,
                            rec = NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$dt_split <- initial_validation_split(local$dt,
                                                 strata=target,
                                                 prop = c(input$slide1/100,(1-input$slide1/100)/2))
      local$dt_train <- training(local$dt_split)
      global$dt_train <- local$dt_train
      local$dt_valid <- validation(local$dt_split)
      global$dt_valid <- local$dt_valid
      local$dt_train_valid <- local$dt_train %>% bind_rows(local$dt_valid)
      global$dt_train_valid <- local$dt_train_valid
      local$dt_test <- testing(local$dt_split)
      global$dt_test <- local$dt_test
      local$rec <- recipe(target~ .,data=local$dt_train)
      global$rec <- local$rec
      local$dt_train_valid_rec <- bake(prep(local$rec),new_data = NULL)
    })
    
    output$print1 <- renderPrint({
      req(local$dt)
      skim(local$dt_train_valid_rec)
    })
    
    observeEvent(input$go2,{
      
     
      if (input$check1){
        local$rec <- local$rec %>% step_normalize(all_numeric_predictors())
      
      }else if(input$check2){
        local$rec <- local$rec %>%  step_dummy(all_nominal_predictors())
      }
      local$dt_train_valid_rec <- bake(prep(local$rec),new_data = NULL)
      global$rec <- local$rec
      
      
    })
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_preparation_ui("stat6_classif_preparation")
    
## To be copied in the server
# mod_stat6_classif_preparation_server("stat6_classif_preparation")
