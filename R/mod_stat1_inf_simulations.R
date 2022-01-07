#' stat1_inf_simulations UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_inf_simulations_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem9",
          h2("Simulation de tirages d'\u00e9chantillons"),
          tags$br(),
          
          fluidRow(
            
            column(4,
                   wellPanel(col="red",
                     
                             tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("select1"),
                                 "Quel indicateur voulez-vous estimer ?",
                                 choices = c("Taux de pauvret\u00e9 (en %)"="PAUVRE","Moyenne d'\u00e2ge"="AGE","Moyenne des revenus disponibles (en \u20ac)"="REV_DISPONIBLE","Moyenne du patrimoine (en \u20ac)"="PATRIMOINE")),
                     sliderInput(ns("slide1"),
                                 "Choisissez la taille de l'\u00e9chantillon :",
                                 min = 1,
                                 max = 5418,
                                 value = 1000),
                     sliderInput(ns("slide2"),
                                 "Choisissez le nombre d'\u00e9chantillons :",
                                 min = 1,
                                 max = 10000,
                                 value = 1000),
                     actionButton(ns("go1"), "Lancez la simulation" )
                   )
                   
                   
            ),
            
            
            column(8,
                  wellPanel(
                    tags$p("Distribution des estimations", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                  plotlyOutput(ns("plotly1"))
                  ) 
                  
            )
            
          )
          
          
          )
  
  
}
    
#' stat1_inf_simulations Server Functions
#'
#' @noRd 
mod_stat1_inf_simulations_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL,echant = NULL,taille_echant = NULL,nbr_simul=NULL,select=NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt %>% mutate(PAUVRE = ifelse(PAUVRE == "1",TRUE,FALSE))
      local$select <- input$select1
      local$taille_echant <- input$slide1
      local$nbr_simul <- input$slide2
      local$go <- input$go1
     
      
    })
    
    output$plotly1 <- renderPlotly({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez un indicateur dans le menu d\u00e9roulant et cliquez pour afficher l'\u00e9chantillon"))
     
     b <- local$go 
     a <- simul_moyenne(data = local$dt,
                        var = local$select,
                        taille_echant = local$taille_echant,
                        nbr_simul = local$nbr_simul)
     if (local$select == "PAUVRE") {a <- a*100}
     histoplotly_simul(serie = a,var = local$select)
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_inf_simulations_ui("stat1_inf_simulations")
    
## To be copied in the server
# mod_stat1_inf_simulations_server("stat1_inf_simulations")
