#' stat1_uni_quali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly ggplotly
#' @importFrom rAmCharts renderAmCharts amChartsOutput
mod_stat1_uni_quali_ui <- function(id){
  ns <- NS(id)

  tabItem(tabName = "subitem3",
          h2("Statistiques univari\u00e9es sur une variable qualitative"),
          br(),
          br(),
  
  fluidRow(
    
    column(4,
           
           wellPanel(
             
             tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
             selectInput(
               ns("select1"),
               "Choisissez une variable \u003A",
               choices = c("MODCOHA" = "LIB_MODCOHA",
                 "PCS" = "LIB_PCS",
                           "DIPL"="LIB_DIPL",
                           "ACT"="LIB_ACT",
                           "PAUVRE"="LIB_PAUVRE")),
             tags$br(),
             # checkboxGroupInput(
             #   ns("check1"),
             #   "Choisissez un graphique \u003A",
             #   choices = c("Diagramme en barre","Diagramme circulaire")),
             actionButton(
               ns("go1"),
               label = "Cliquez pour afficher")
             
           )
           
           
    ),
    
    column(8,
           wellPanel(
             tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
           plotlyOutput(ns("plot1"))
           # amChartsOutput(ns("plot1"))
           )
    )
  ),
  fluidRow(
    
    column(4,),
    column(8,
           wellPanel(
             tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
           DTOutput(ns("tab1"))
           )
           )
    )
  
  
  )
  
}
    
#' stat1_uni_quali Server Functions
#'
#' @noRd 
mod_stat1_uni_quali_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL,var = NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- global$dt
      local$var <- input$select1
      
    })
    
    output$tab1 <- renderDT({
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
     a <- tri_plat(local$dt,local$var)  
     a %>% DT::datatable(class = "row-border")
        
      
    })
    
    # output$plot1 <- renderAmCharts({
    #   
    # # rambarplot_quali(local$dt,local$var)
    # rAmCharts::amHist(iris$Petal.Length)
    #     
    # })
    
    output$plot1 <- renderPlotly({
    
    validate(need(expr = !is.null(local$dt),
                  message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique"))    
  graphggplotly_diagbarre(local$dt,local$var)
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_uni_quali_ui("stat1_uni_quali")
    
## To be copied in the server
# mod_stat1_uni_quali_server("stat1_uni_quali")
