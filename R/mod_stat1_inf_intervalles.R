#' stat1_inf_intervalles UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom stats t.test prop.test  
mod_stat1_inf_intervalles_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem10",
          h2("Intervalles de confiance"),
          tags$br(),
          
          fluidRow(
            
            column(4,
                   
                   
                   
                   wellPanel(
                     
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = c("Taux de pauvret\u00e9 (en %)"="PAUVRE",
                                             "Moyenne d'\u00e2ge"="AGE",
                                             "Moyenne des revenus disponibles (en \u20ac)"="REV_DISPONIBLE",
                                             "Moyenne du patrimoine (en \u20ac)"="PATRIMOINE")
                                   
                                   
                                   ),
                     
                     sliderInput(ns("slide1"),
                                 "Choisissez la taille de l'\u00e9chantillon :",
                                 min = 1,
                                 max = 5418,
                                 value = 1000),
                     
                     sliderInput(ns("slide2"),
                                 "Choisissez un niveau de confiance :",
                                 min = 0.90,
                                 max = 0.99,
                                 value = 0.95,
                                 step = 0.01),
                     
                     actionButton(ns("go1"), 
                                  "Calculez l'intervalle de confiance" )
                   )
                   
                   
            ),
            
            
            column(4,
                   
                   tags$p("Calcul de l'intervalle de confiance", 
                          style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                  
                          infoBox(
                            title = "Borne inf\u00e9rieure",
                            value = textOutput(ns("borneinf")),
                            # subtitle = "Borne inf\u00e9rieure",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=12
                          ),
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
                            title = "Borne sup\u00e9rieure",
                            value = textOutput(ns("bornesup")),
                            # subtitle = "Borne sup\u00e9rieure",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=12
                          ),
                   
                   infoBox(
                     title = "Valeur recherch\u00e9ee",
                     value = textOutput(ns("vraie")),
                     # subtitle = "Source : Grandile",
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="green",
                     width=12
                   )
                   
            )
            
            
            # column(4,
            #        infoBox(
            #          title = "Vraie Valeur",
            #          value = textOutput(ns("vraie")),
            #          # subtitle = "Source : Grandile",
            #          icon = icon("chart-line"),
            #          #fill = TRUE,
            #          color="aqua",
            #          width=12
            #        )
            #        
            # )
            
            
          )
          
          )
  
  
}
    
#' stat1_inf_intervalles Server Functions
#'
#' @noRd 
mod_stat1_inf_intervalles_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    local <- reactiveValues(dt = NULL,echant = NULL,taille_echant = NULL,select=NULL,conf=NULL)

    observeEvent(input$go1,{

      local$dt <- global$dt %>% mutate(PAUVRE = ifelse(PAUVRE == "1",TRUE,FALSE))
      local$taille_echant <- input$slide1
      local$echant <- local$dt %>% sample_n(local$taille_echant)
      local$select <- input$select1
      local$conf <- input$slide2
    

    })
    
    output$vraie <- renderText({
      
      req(local$dt)
      t <- local$dt
      a <- mean(t[,local$select])
      if (local$select=="PAUVRE"){
        b <- a*100
      }
      else {
        b <- a
      }
      format_box(b)
      

      
    })
    
    output$estime <- renderText({
      
      req(local$dt)
      t <- local$echant
      a <- mean(t[,local$select])
      if (local$select=="PAUVRE"){
        b <- a*100
      }
      else {
        b <- a
      }
      format_box(b)
      
    })
    
    output$borneinf <- renderText({
      
      req(local$dt)
      t <- local$echant
      if (local$select=="PAUVRE"){
        n_pauvres <- mean(t[,local$select])*local$taille_echant #nombre de pauvres
        test <- prop.test(n_pauvres,local$taille_echant,conf.level = local$conf)
        a <- test$conf.int
        b <- a[1]*100
      } 
      
      else {
        
        test <- t.test(t[,local$select],conf.level = local$conf)
        a <- test$conf.int
        b <- a[1]
      }
      
      format_box(b)
      
    })
    
    output$bornesup <- renderText({
      
      req(local$dt)
      t <- local$echant
      if (local$select=="PAUVRE"){
        n_pauvres <- mean(t[,local$select])*local$taille_echant #nombre de pauvres
        test <- prop.test(n_pauvres,local$taille_echant,conf.level = local$conf)
        a <- test$conf.int
        b <- a[2]*100
      } 
      
      else {
        
        test <- t.test(t[,local$select],conf.level = local$conf)
        a <- test$conf.int
        b <- a[2]
      }
      
      format_box(b)
      
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_intervalles_ui("stat1_inf_intervalles")
    
## To be copied in the server
# mod_stat1_inf_intervalles_server("stat1_inf_intervalles")
