#' stat1_bi_quantiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquali_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitem7",
          h2("Etude des corr\u00e9lations entre une variable quantitative et une qualitative"),
          
          br(),
          br(),
          fluidRow(column(4,
                          
                          wellPanel(
                            selectInput(ns("select1"),
                                        label = "Choisissez une variable qualitative :",
                                        choices = c("MODCOHA",
                                                    "PCS",
                                                    "DIPL",
                                                    "ACT",
                                                "PAUVRE")),
                            selectInput(ns("select2"),
                                        label = "Choisissez une variable quantitative :",
                                        choices = c("AGE","REV_DISPONIBLE","PATRIMOINE")),
                            actionButton(ns("go1"),
                                         label = "Cliquez pour afficher")
                            
                            
                          )
                          
          ),
          
          column(8,
                 h3("Graphique"),
                 plotlyOutput(ns("plotly1"))        
                 
          )
          ),
          br(),
          br(),
          
          fluidRow(column(4,),
                   column(8,
                          
                          h3("Formule de décomposition de la variance"),
                          
                          infoBox(
                            title = "Variance",
                            value = textOutput(ns("var")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          ),
                          infoBox(
                            title = "Variance Intra",
                            value = textOutput(ns("intra")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          ),
                          infoBox(
                            title = "Variance Inter",
                            value = textOutput(ns("inter")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=4
                          )
                          
                          
                          )),
          
          fluidRow(column(4,),
                   column(8,
                          
                          h3("Indicateur d'intensit\u00e9 de la corr\u00e9lation"),
                          infoBox(
                            title = "Rapport de corr\u00e9lation",
                            value = textOutput(ns("eta2")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          )
                          
                   ))
          
          
          
          
          
          
          
          
          
          
          
          
          )
  
  
}
    
#' stat1_bi_quantiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquali_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    local <- reactiveValues(dt = NULL,
                            varquali = NULL,
                            varquanti=NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$varquali <- input$select1
      local$varquanti <- input$select2
      
    })
 
    output$plotly1 <- renderPlotly({
      
      
      graphggplotly_qualiquanti(local$dt,
                                local$varquali,
                                local$varquanti)
      
    })
    
    output$var <- renderText({
      
      "10"
      
    })
    
    output$intra <- renderText({
      
      "10"
      
    })
    
    output$inter <- renderText({
      
      "10"
      
    })
    
    output$eta2 <- renderText({
      
      "10"
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquali_ui("stat1_bi_quantiquali")
    
## To be copied in the server
# mod_stat1_bi_quantiquali_server("stat1_bi_quantiquali")
