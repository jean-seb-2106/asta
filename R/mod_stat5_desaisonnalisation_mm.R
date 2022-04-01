#' stat5_desaisonnalisation_mm UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat5_desaisonnalisation_mm_ui <- function(id){
  ns <- NS(id)
  
  tabItem(
    
    
    tabName = "subitem_4",
    h2("Désaisonnaliser avec les moyennes mobiles"),
    br(),
    br(),
    
    fluidRow(
      
      column(4,
             
             wellPanel(
               
               
               tags$p("Param\u00e8tres", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               
               selectInput(
                 inputId = ns("select1"),
                 label = "Choisissez une s\u00e9rie :",
                 choices = c("Trafic a\u00e9rien"="airpass",
                             "Fr\u00e9quentation hoteliere"="hotel")
               ),
               
               selectInput(
                 inputId = ns("select2"),
                 label = "Choisissez un modele :",
                 choices = c("Modele additif"="additive",
                             "Modele multiplicatif"="multiplicative")
               ),
               
               actionButton(
                 ns("go1"),
                 label = "Cliquez pour désaisonnaliser"
               )
               
               
               
             )
             
             
      ),
      
      column(8,
             
             wellPanel(
               tags$p("Graphique", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               dygraphOutput(ns("plot1"))
             )
             
      )
      
      
      
    )
    
    
    
    
    
    
    
    
    
  )
  
  
  
}
    
#' stat5_desaisonnalisation_mm Server Functions
#'
#' @noRd 
mod_stat5_desaisonnalisation_mm_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(ts=NULL,log_ts=NULL,modele=NULL)
    
    observeEvent(input$go1,{
      local$ts <- eval(parse(text=input$select1))
      local$log_ts <- log(local$ts)
      local$modele <- input$select2
      
    })
    
    output$plot1 <- renderDygraph({
      
      validate(need(expr = !is.null(local$ts),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
      # shinipsum::random_dygraph()
      
      x <- local$ts
      if(local$modele=="multiplicative"){
        ycvs <- cvs_mm_desais(local$log_ts)
        xcvs <- exp(ycvs)
      }else{
        xcvs <- cvs_mm_desais(local$ts)
      }
      dygraph_reg_cvs(x,xcvs)
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat5_desaisonnalisation_mm_ui("stat5_desaisonnalisation_mm")
    
## To be copied in the server
# mod_stat5_desaisonnalisation_mm_server("stat5_desaisonnalisation_mm")
