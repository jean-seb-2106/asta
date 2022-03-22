#' stat4_lineaire_multiple UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_lineaire_multiple_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "reg_multiple",
            h2("R\u00e9gression lin\u00e9aire multiple"),
            fluidRow(
              column(4,
                     
                     wellPanel(
                       tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       selectInput(ns("Varexpliquee"), 
                                   "Choisissez une variable \u00e0 expliquer",
                                   choices = c("PIB par hab."="gdp_per_capita","PIB"="gdp","Mortalité inf."="infant_mortality","Espérance de vie"="life_expectancy","Fécondité"="fertility","Population"="population")),
                       
                       selectizeInput(ns("Varexplicative"), 
                                      "Choisissez des variables explicatives",
                                      choices = c("Mortalité inf."="infant_mortality","Espérance de vie"="life_expectancy","Fécondité"="fertility","Population"="population","PIB par hab."="gdp_per_capita","PIB"="gdp"),
                                      multiple = TRUE  ),
                       
                       checkboxInput(inputId=ns("constante"), "Retirer la constante", value = FALSE, width = NULL),
                       actionButton(inputId=ns("go"),"Mettre \u00e0 jour")),
                     
                     
                     wellPanel(
                       tags$p("Coeff de détermination R2", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
                       ,
                       verbatimTextOutput(ns("coeffcorr")),br(),
                       "Compris entre 0 et 1, le coefficient de détermination ou R2 donne le % de variance expliqué par le modèle.",br(),
                       br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")) 
              ),
              
              column(8,
                     wellPanel(
                       tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       verbatimTextOutput(ns("tab1")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
                    
                      
              )
            )
    ))
  
}
    
#' stat4_lineaire_multiple Server Functions
#'
#' @noRd 
mod_stat4_lineaire_multiple_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL,var_expliquee = NULL )
    global <- reactiveValues(dt = gapminder)
    
    observeEvent(input$go, {
      local$dt <- global$dt
      local$constante <- input$constante
      
     # local$constante <- input$constante
      local$model <- model_lineaireM_tab(input_data = local$dt,
                                         var_expliquee = input$Varexpliquee,
                                         var_explicatives = input$Varexplicative,
                                         constante = local$constante     )
      
    })
    
    output$tab1 <- renderPrint({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
    # browser()
      print(local$model)
    })
    
    output$coeffcorr <- renderPrint({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      
      # browser()
      
      c <- round(as.numeric(local$model[8]),2)
      c
    })

    
  })
}
    
## To be copied in the UI
# mod_stat4_lineaire_multiple_ui("stat4_lineaire_multiple_ui_1")
    
## To be copied in the server
# mod_stat4_lineaire_multiple_server("stat4_lineaire_multiple_ui_1")
