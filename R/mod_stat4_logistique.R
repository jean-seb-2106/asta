#' stat4_logistique UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_logistique_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    
    tabItem(tabName = "reg_logistique",
            h2("R\u00e9gression logistique"),
            fluidRow(
              column(4,
                     
                     wellPanel(
                       tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       selectInput(ns("Varexpliquee"), 
                                   "Choisissez une variable \u00e0 expliquer",
                                   choices = c("appartement","maison")),
                       
                       selectizeInput(ns("Varexplicative"), 
                                      "Choisissez des variables explicatives",
                                      choices = c("coco","popo","toto","roro"),
                                      multiple = TRUE  ),
                       
                       actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats")),
                     
                     wellPanel(span("BLABLABLA  :", style="color:blue"), 
                               " BLABLABLA")
              ),
              
              column(8,
                     wellPanel(
                       tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       DTOutput(ns("tab1")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")),
                     wellPanel(
                       tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       DTOutput(ns("tab2")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")),
                     
                     
                     
              )
            )
    ))
  
}
    
#' stat4_logistique Server Functions
#'
#' @noRd 
mod_stat4_logistique_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      
    })
    
    output$tab1 <- renderDT({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
      shinipsum::random_DT(nrow = 8, ncol = 4)
    })
    
    output$tab2 <- renderDT({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
      shinipsum::random_DT(nrow = 8, ncol = 4)
    })
    
  })
}
    
## To be copied in the UI
# mod_stat4_logistique_ui("stat4_logistique_ui_1")
    
## To be copied in the server
# mod_stat4_logistique_server("stat4_logistique_ui_1")
