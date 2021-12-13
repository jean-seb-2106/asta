#' stat1_uni_quali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_uni_quali_ui <- function(id){
  ns <- NS(id)

  tabItem(tabName = "subitem3",
          h2("Statistiques univariées sur une variable qualitative"),
          br(),
          br(),
  
  fluidRow(
    
    column(4,
           
           wellPanel(
             
             selectInput(
               ns("select1"),
               "Choisissez une variable :",
               choices = c("LIB_PCS")),
             checkboxGroupInput(
               ns("check1"),
               "Choisissez un graphique :",
               choices = c("a","b")),
             actionButton(
               ns("go1"),
               label = "Cliquez pour afficher")
             
           )
           
           
    ),
    
    column(8,
           h3("Graphique"),
           plotOutput(ns("plot1"))
           
           
    )
  ),
  fluidRow(
    
    column(4,),
    column(8,
           h3("Tris à plat"),
           DTOutput(ns("tab1"))
           
           )
    )
  
  
  )
  
}
    
#' stat1_uni_quali Server Functions
#'
#' @noRd 
mod_stat1_uni_quali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL)
    
    observeEvent(input$go1,{
      
      local$dt <- grandile
      
    })
    
    output$tab1 <- renderDT({
     
      
     a <- tri_plat(local$dt,input$select1)  
     DT::datatable(a)
        
      
    })
    
    output$plot1 <- renderPlot({
      
      random_ggplot()
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_uni_quali_ui("stat1_uni_quali")
    
## To be copied in the server
# mod_stat1_uni_quali_server("stat1_uni_quali")
