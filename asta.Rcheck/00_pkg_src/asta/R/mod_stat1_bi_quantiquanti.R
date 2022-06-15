#' stat1_bi_quantiquanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_quantiquanti_ui <- function(id){
  ns <- NS(id)

  tabItem(tabName = "subitem5",
          h2("Etude des corr\u00e9lations entre deux variables quantitatives"),
          br(),
          br(),
          fluidRow(column(4,
                          
                          wellPanel(
                            tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                            selectInput(ns("select1"),
                                        label = "Choisissez une variable en abscisse :",
                                        choices = c("AGE","REV_DISPONIBLE","PATRIMOINE"),
                                        selected = "REV_DISPONIBLE"),
                            selectInput(ns("select2"),
                                        label = "Choisissez une variable en ordonn\u00e9e:",
                                        choices = c("AGE","REV_DISPONIBLE","PATRIMOINE"),
                                        selected = "PATRIMOINE"),
                            actionButton(ns("go1"),
                                         label = "Cliquez pour afficher")
                            
                            
                            )
                          
                          ),
                   column(8,
                          wellPanel(
                            tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),        
                           plotlyOutput(ns("plotly1"))        
                          )
                                   )
                   ),
          br(),
          br(),
          fluidRow(column(4,),
                   column(8,
                          
                          tags$p("Indicateur d'intensit\u00e9 de la corr\u00e9lation", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                          # h3("Indicateur d'intensit\u00e9 de la corr\u00e9lation"),
                                     infoBox(
                                       title = "Coefficient de corr\u00e9lation lin\u00e9aire",
                                       value = textOutput(ns("cor")),
                                       # subtitle = "Source : Grandile",
                                       icon = icon("chart-line"),
                                       #fill = TRUE,
                                       color="aqua",
                                       width=8
                                     )
                          
                                     ))
          
          )
  
  
}
    
#' stat1_bi_quantiquanti Server Functions
#'
#' @noRd 
mod_stat1_bi_quantiquanti_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
 
    local <- reactiveValues(dt = NULL,
                            var1 = NULL,
                            var2=NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$var1 <- input$select1
      local$var2 <- input$select2
      
    })  
       
 output$plotly1 <- renderPlotly({
   
   validate(need(expr = !is.null(local$dt),
                 message = "Choisissez les variables dans le menu d\u00e9roulant et cliquez pour afficher le graphique"))
   
   
   graphggplotly_nuage(local$dt,local$var1,local$var2)
   
 })
    

 output$cor <- renderText({
   
   req(local$dt)
   a <- cor(grandile[,local$var1],grandile[,local$var2])
   format_box(a)
   
 })
 
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_quantiquanti_ui("stat1_bi_quantiquanti")
    
## To be copied in the server
# mod_stat1_bi_quantiquanti_server("stat1_bi_quantiquanti")
