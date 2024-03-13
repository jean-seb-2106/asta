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
                      actionButton(ns("go1"), "Ajuster le modèle retenu")
                      
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
                             
                             wellPanel(tags$p("Résultats du modèle", 
                                              style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                       verbatimTextOutput(ns("print1"))),
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
                             
                             wellPanel(tags$p("Prévisions", 
                                              style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                                       DTOutput(ns("dt1"))
                                       
                                       
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
    
    
    local <- reactiveValues(dt=NULL,
                            wflow=NULL,
                            fit_final=NULL,
                            pred=NULL)
    
    observeEvent(input$go1,{
      local$dt <- global$dt_train_valid
      local$wflow <- global$wflow
      local$fit_final <- local$wflow %>% fit(local$dt)
      # local$metrics <- metric_set(accuracy,roc_auc,sensitivity, specificity)
      # local$fit <- local$wflow %>% fit_resamples(local$folds,
      #                                      metrics = local$metrics,
      #                                      control = control_resamples(save_pred = TRUE))
      # local$pred <- collect_predictions(local$fit)
      local$pred <- augment(local$fit_final,global$dt_test) %>% select(target,starts_with(".pred"))
    })
    
    output$print1 <- renderPrint({
      
      req(local$dt)

      extract_fit_parsnip(local$fit_final)
      
      # shinipsum::random_print(type = "model")
      
    })
    
    
    output$dt1 <- renderDT({
      
      # shinipsum::random_DT(nrow = 5,ncol = 5)
      req(local$dt)
      local$pred
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
