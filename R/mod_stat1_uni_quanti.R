#' stat1_uni_quanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_uni_quanti_ui <- function(id){
  ns <- NS(id)

  
  tabItem(tabName = "subitem4",
          h2("Statistiques univariées sur une variable quantitative"),
          br(),
          br(),
          
          
          fluidRow(
            column(4, 
                   
                   wellPanel(
                     
                     selectInput(ns("select1"),
                                 "Choisissez une variable :",
                                 choices = c("REV_DISPONIBLE","PATRIMOINE")),
                     sliderInput(ns("slider1"),
                                 "Choisissez le nombre de classes : ",
                                 min = 1,
                                 max = 30,
                                 value = 10),
                     actionButton(ns("go1"),"Cliquez pour afficher")
                     
                     
                   )
            ),
            column(8,
                   h3("Graphique"),
                   plotlyOutput(ns("plotly1"))
                   
                   
            )),
          
          fluidRow(column(4,),
                   column(8,
                          h3("Indicateurs de tendance centrale et de position"),
                          valueBox(
                            subtitle = "Moyenne",
                            value = textOutput(ns("moyenne")),
                            #subtitle = "Moyenne",
                            # icon = icon("chart-line"),
                            # fill = TRUE,
                            color="red",
                            width=3
                          ),
                          
                          valueBox(
                            subtitle = "Médiane",
                            value = textOutput(ns("mediane")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="green",
                            width=3
                          ),
                          
                          #Premier Quartile
                          valueBox(
                            subtitle = "Premier Quartile",
                            value = textOutput(ns("q1")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          ),
                          
                          #Premier Quartile
                          valueBox(
                            subtitle = "Troisième quartile",
                            value = textOutput(ns("q3")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          )
                          
                          )),
          fluidRow(column(4,),
                   column(8,
                          h3("Indicateurs de dispersion"),
                          
                          valueBox(
                            subtitle = "Etendue",
                            value = textOutput(ns("etendue")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          ),
                          #Ecart inter-quartile
                          valueBox(
                            subtitle = "Ecart Interquartile",
                            value = textOutput(ns("iiq")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          ),
                          #Ecart-type
                          valueBox(
                            subtitle = "Ecart-type",
                            value = textOutput(ns("sd")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          ),
                          
                          # Coefficient de variation
                          valueBox(
                            subtitle = "Coefficient de variation",
                            value = textOutput(ns("cv")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("credit-card"),
                            #fill = TRUE,
                            color="aqua",
                            width=3
                          )
                          
                         
                          
                          # valueBoxOutput("valuebox1")
                          
                          ))
          
          
          
  )
  
  
}
    
#' stat1_uni_quanti Server Functions
#'
#' @noRd 
mod_stat1_uni_quanti_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL,var = NULL,class=NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$var <- input$select1
      local$class <- input$slider1
      
    })
    
    output$plotly1 <- renderPlotly({
     
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le graphique"))
       
     graphggplotly_histo(local$dt,local$var,local$class)
      
    })
    
    output$moyenne <- renderText({
      
      "10"
      
    })
    
    output$mediane <- renderText({
      
      "10"
      
    })
    
    output$q1 <- renderText({
      
      "10"
      
    })
    
    output$q3 <- renderText({
      
      "10"
      
    })
    
    output$etendue <- renderText({
      
      "10"
      
    })
    
    output$iiq <- renderText({
      
      "10"
      
    })
    
    output$sd <- renderText({

      "10"

    })
    
    # output$valuebox1 <- renderValueBox({
    #   
    #   valueBox(value = 10,
    #            subtitle = "Coefficient de variation"
    #     
    #   )
    #   
    # })
    
    output$cv <- renderText({

      paste("10","%")

    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_uni_quanti_ui("stat1_uni_quanti")
    
## To be copied in the server
# mod_stat1_uni_quanti_server("stat1_uni_quanti")
