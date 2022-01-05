#' stat1_uni_quanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom stats median sd quantile 
mod_stat1_uni_quanti_ui <- function(id){
  ns <- NS(id)

  
  tabItem(tabName = "subitem4",
          h2("Statistiques univari\u00e9es sur une variable quantitative"),
          br(),
          br(),
          
          
          fluidRow(
            column(4, 
                   
                   wellPanel(
                     
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("select1"),
                                 "Choisissez une variable :",
                                 choices = c("AGE","REV_DISPONIBLE","PATRIMOINE")),
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
                          
                          valueBox(
                            subtitle = "M\u00e9diane",
                            value = textOutput(ns("mediane")),
                            #subtitle = "Source : Cefil 2020",
                            # icon = icon("chart-line"),
                            #fill = TRUE,
                            color="green",
                            width=3
                          ),
                          
                          #Troisième Quartile
                          valueBox(
                            subtitle = "Troisi\u00e8me quartile",
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
 
    local <- reactiveValues(dt = NULL,
                            var = NULL,
                            class=NULL,
                            mean=NULL,
                            sd=NULL,
                            q1 = NULL,
                            q3 = NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$var <- input$select1
      local$class <- input$slider1
      
    })
    
    output$plotly1 <- renderPlotly({
     
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique"))
       
     graphggplotly_histo(local$dt,local$var,local$class)
      
    })
   
    output$moyenne <- renderText({
    
    req(local$dt) 
        
    local$mean <- mean(local$dt[,local$var],na.rm = TRUE)
    format_box(local$mean)  
    
    })
    
    output$mediane <- renderText({
      
      req(local$dt) 
      
      a <- median(local$dt[,local$var],na.rm = TRUE)
      format_box(a)  
      
    })
    
    output$q1 <- renderText({
      
      req(local$dt) 
      
      local$q1 <- quantile(local$dt[,local$var],na.rm = TRUE,probs = 0.25)
      format_box(local$q1) 
      
    })
    
    output$q3 <- renderText({
      
      req(local$dt) 
      
      local$q3 <- quantile(local$dt[,local$var],na.rm = TRUE,probs = 0.75)
      format_box(local$q3)  
      
    })
    
    output$etendue <- renderText({
      
      req(local$dt) 
      
      a <- min(local$dt[,local$var],na.rm = TRUE)
      b <- max(local$dt[,local$var],na.rm = TRUE)
      c <- b - a
      format_box(c) 
      
    })
    
    output$iiq <- renderText({
      
      req(local$dt) 
      
      a <- local$q3 - local$q1
      format_box(a) 
      
    })
    
    output$sd <- renderText({

      req(local$dt) 
      
      local$sd <- sd(local$dt[,local$var],na.rm = TRUE)
      format_box(local$sd) 

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
      
      req(local$dt) 
      
    a <- (local$sd/local$mean)*100
    format_box(a)

    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_uni_quanti_ui("stat1_uni_quanti")
    
## To be copied in the server
# mod_stat1_uni_quanti_server("stat1_uni_quanti")
