#' stat2_redress_corrna UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_corrna_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemk",
          h2("Etude corr\u00e9lation non r\u00e9ponse"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("NomVarRedress2"), 
                                 "Choisissez une variable \u00e0 \u00e9tudier",
                                 choices = c("Age"="AGE_TRANCHE",
                                             "pcs"="PCS",
                                             "activité"="ACT",
                                             "revenu"="REV_DISPONIBLE_TRANCHE")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour"))
            ),
            
            column(8,
                   
                   fluidRow(
                     
                            
                            infoBox(
                            title = "V de cramer",
                              value = textOutput(ns("vcramer")),
                              subtitle = "Source : Cefil 2021",
                              icon = icon("chart-line"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            
                            
                     )),
                     
                        fluidRow(    
                            infoBox(
                              title = "Chi2",
                              value = textOutput(ns("chi2")),
                              subtitle = "Source : Cefil 2021",
                              icon = icon("chart-line"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                     ))
                   )
            )
        
  
}
    
#' stat2_redress_corrna Server Functions
#'
#' @noRd 
mod_stat2_redress_corrna_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    global <- reactiveValues(dt_apur = grandile_redress)
    
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
      
      local$dt <- global$dt_apur 
      local$var <- input$NomVarRedress2
    }) 
    
    output$vcramer <- renderText({
      req(local$dt, local$var)
var1 <- local$dt[,REPONDANT_C]
var2 <- local$dt[, local$var]
      t1 <- table(var1,var2)
      format(as.numeric(cramer.v(t1)), digits = 2)
    })
    
    output$chi2 <- renderText({
      req(local$dt, local$var)
      var1 <- local$dt[,REPONDANT_C]
      var2 <- local$dt[, local$var]
      t1 <- table(var1,var2)
      format(as.numeric(chisq.test(t1)[1]),digits=4)
    })
    
    
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_corrna_ui("stat2_redress_corrna")
    
## To be copied in the server
# mod_stat2_redress_corrna_server("stat2_redress_corrna")
