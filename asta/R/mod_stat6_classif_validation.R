#' stat6_classif_validation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom rsample vfold_cv
#' @importFrom tune control_resamples conf_mat_resampled autoplot fit_resamples collect_predictions
#' @importFrom yardstick metric_set accuracy roc_auc sensitivity specificity roc_curve
mod_stat6_classif_validation_ui <- function(id){
  ns <- NS(id)
  
  tabItem("subitem__4",
          h2("Validation du modèle"),
          
          fluidRow(
            
            
            column(3,
                   
                   
                   wellPanel(
              
              
              
              tags$p("Paramètres", 
                     style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
              
              sliderInput(ns("slide1"),"Validation croisée : nombre de folds",min=5,max=10,step=5,value = 10),
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
                                       plotOutput(ns("plot1"))),
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
                       plotOutput(ns("plot2"))
                       
                       
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
    
    local <- reactiveValues(dt=NULL,
                            folds=NULL,
                            wflow=NULL,
                            metrics=NULL,
                            fit=NULL)
    
    observeEvent(input$go1,{
      local$dt <- global$dt_train_valid
      local$folds <- vfold_cv(local$dt,
                              v = input$slide1)
      local$wflow <- global$wflow
      local$metrics <- metric_set(accuracy,roc_auc,sensitivity, specificity)
      local$fit <- local$wflow %>% fit_resamples(local$folds,
                                           metrics = local$metrics,
                                           control = control_resamples(save_pred = TRUE))
      local$pred <- collect_predictions(local$fit)
    })
    
    output$plot1 <- renderPlot({
      
      req(local$dt)
      # shinipsum::random_ggplot()
      conf_mat_resampled(local$fit, tidy = FALSE) %>%
        autoplot(type = "heatmap")
      
    })
    
    
    output$plot2 <- renderPlot({
      
      req(local$dt)
      # shinipsum::random_ggplot()
      local$pred %>% 
        roc_curve(truth = target, .data[[names(local$pred)[4]]]) %>% 
        autoplot()
      
    })
    
    output$txt1 <- renderText({
      shinipsum::random_text(nwords = 100)
    })
    
    output$accuracy <- renderText({
      
 req(local$dt)
      
      local$pred %>% 
        accuracy(truth = target, .pred_class) %>% 
        select(.estimate) %>% 
        as.numeric() %>% 
        format_box()
    })
    
    output$spec <- renderText({
      
      req(local$dt)
      
      local$pred %>% 
        specificity(truth = target, .pred_class) %>% 
        select(.estimate) %>% 
        as.numeric() %>% 
        format_box()
    })
    
    output$sens <- renderText({
      
      req(local$dt)
      
      local$pred %>% 
        sensitivity(truth = target, .pred_class) %>% 
        select(.estimate) %>% as.numeric() %>% 
        format_box()
    })
    
    output$AUC <- renderText({
      
      req(local$dt)
      
      local$pred %>% 
        roc_auc(truth = target, .data[[names(local$pred)[4]]]) %>% 
        select(.estimate) %>% as.numeric() %>% 
        format_box()
    })
    
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_validation_ui("stat6_classif_validation")
    
## To be copied in the server
# mod_stat6_classif_validation_server("stat6_classif_validation")
