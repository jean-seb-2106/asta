#' stat4_lineaire_simple UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_lineaire_simple_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "reg_lineaire",
            h2("R\u00e9gression lin\u00e9aire simple"),
            fluidRow(tags$style("background-color : #E3F2FD;"),
              column(4,
                     
                     wellPanel(
                       tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       selectInput(ns("Varexpliquee"), 
                                   "Choisissez une variable \u00e0 expliquer",
                                   choices = c("Nb de personnes ménage"="NBPERS","Nb de pièces logement"="NBPIECES","Patrimoine"="PATRIMOINE", "Revenu Disponible"="REV_DISPONIBLE")),
                       
                       selectInput(ns("Varexplicative"), 
                                   "Choisissez la variable explicative",
                                   choices = c("Nb de personnes ménage"="NBPERS","Nb de pièces logement"="NBPIECES","Patrimoine"="PATRIMOINE", "Revenu Disponible"="REV_DISPONIBLE")),
                       
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
                       tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regline")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     )
                     
                     
              )
            )
    ))
    
}
    
#' stat4_lineaire_simple Server Functions
#'
#' @noRd 
mod_stat4_lineaire_simple_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL, var_explicative = NULL,var_expliquee = NULL )
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      local$var_explicative <- input$Varexplicative
      local$var_expliquee <- input$Varexplicative

    })
    
    output$tab1 <- renderDT({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
     model_lineaireS_tab(input_data=local$dt, var_expliquee = local$var_expliquee , var_explicative = local$var_explicative)
    })
    
    output$regline <- renderPlot(
      {
        validate(
          need(expr = !is.null(local$dt),
               message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
        )
        shinipsum::random_ggplot(type = "random")
       
        
      }
      
    )
    
  })
}
    
## To be copied in the UI
# mod_stat4_lineaire_simple_ui("stat4_lineaire_simple_ui_1")
    
## To be copied in the server
# mod_stat4_lineaire_simple_server("stat4_lineaire_simple_ui_1")
