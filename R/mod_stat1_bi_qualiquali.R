#' stat1_bi_qualiquali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat1_bi_qualiquali_ui <- function(id){
  ns <- NS(id)
  
  
  tabItem(tabName = "subitem6",
          h2("Etude des corr\u00e9lations entre deux variables qualitatives"),
          
          br(),
          br(),
          fluidRow(column(4,
                          
                          wellPanel(
                            selectInput(ns("select1"),
                                        label = "Choisissez une variable :",
                                        choices =c("MODCOHA",
                                                   "PCS",
                                                    "DIPL",
                                                    "ACT",
                                                    "PAUVRE"),
                                        selected = "PCS"),
                            selectInput(ns("select2"),
                                        label = "Choisissez une variable :",
                                        choices = c("MODCOHA",
                                                    "PCS",
                                                    "DIPL",
                                                    "ACT",
                                                    "PAUVRE"),
                                        selected = "DIPL"),
                            checkboxInput(ns("check1"),label = "Afficher le tableau en profil ligne"),
                            actionButton(ns("go1"),label = "Cliquez pour afficher")
                            
                            
                          )
                          
          ),
          column(8,
                 h3("Tableau crois\u00e9 en structure"),
                 DTOutput(ns("tab1"))        
                 
          )
          ),
          br(),
          br(),
          fluidRow(column(4,),
                   column(8,
                          h3("Indicateur d'intensit\u00e9 de la corr\u00e9lation"),
                          infoBox(
                            title = "Chi-2",
                            value = textOutput(ns("chi2")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          ),
                          infoBox(
                            title = "V de Cramer",
                            value = textOutput(ns("vcramer")),
                            # subtitle = "Source : Grandile",
                            icon = icon("chart-line"),
                            #fill = TRUE,
                            color="aqua",
                            width=6
                          )
                          
                   ))
          
          
          
          
          
          
          )
  
  
}
    
#' stat1_bi_qualiquali Server Functions
#'
#' @noRd 
mod_stat1_bi_qualiquali_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    local <- reactiveValues(
      dt=NULL)
    
    observeEvent(input$go1,{
      local$dt <- global$dt
      local$varquali1 <- input$select1
      local$varquali2 <- input$select2
      local$colonne <- input$check1
      local$table <- table(global$dt[,input$select1],global$dt[,input$select2])
      
    })
    
    output$tab1 <- renderDT({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
      t <- tableau_croise(local$dt,local$varquali1,local$varquali2,ligne=local$colonne)
     datatable(t,class = "compact",rownames = FALSE)
      
    })
    
    output$chi2 <- renderText({
      
      req(local$dt)
      chi2 <- as.numeric(chisq.test(local$table)[1])
      format_box(chi2)
      
    })
    
    
    output$vcramer <- renderText({
      
      req(local$dt)
      vcramer <- cramer.v(local$table)
      format_box(vcramer)
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat1_bi_qualiquali_ui("stat1_bi_qualiquali")
    
## To be copied in the server
# mod_stat1_bi_qualiquali_server("stat1_bi_qualiquali")
