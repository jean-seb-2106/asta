#' stat2_redress_impact UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_impact_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subiteml",
          h2("Redressement et impact"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Paramètres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable à étudier",
                                 choices = c("Superficie du jardin"="SUPERF_JARDIN", "Superficie du logement"="SUPERF_LOG")),
                     
                     actionButton(inputId=ns("go"),"Mettre à jour les résultats")),
                   
                   infoBox(
                     title = "Moyenne des poids",
                     value = "10",
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = "Ecart type des poids",
                     value = "10",
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   )
            ),
            
            column(8,
                   
                   fluidRow(
                     column(6,
                            
                            
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = "10",
                              subtitle = "Redressé",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = "10",
                              subtitle = "Non redressé",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = "10",
                              subtitle = "Population mère",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                            
                     ),
                     column(6,
                            
                            infoBox(
                              title = "Patrimoine moyen",
                              value = "10",
                              subtitle = "Redressé",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = "10",
                              subtitle = "Non redressé",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = "10",
                              subtitle = "Population mère",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                     )),
                   fluidRow(
                     
                     
                     column(width=12,
                            
                            wellPanel(
                              tags$p("Tableau", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              DTOutput(ns("tab1")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            )  )
                   )
            )
          )
  )
  
}
    
#' stat2_redress_impact Server Functions
#'
#' @noRd 
mod_stat2_redress_impact_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt_apur = grandile_apur)
    
    local <- reactiveValues(
      dt=NULL)
    
    observeEvent(input$go,{
      local$dt <- global$dt_apur
      
    })
    
   output$tab1 <- renderDT({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le tableau"))
      
     shinipsum::random_DT(ncol = 4, nrow = 10)
    
  })
  }
)}
    
## To be copied in the UI
# mod_stat2_redress_impact_ui("stat2_redress_impact")
    
## To be copied in the server
# mod_stat2_redress_impact_server("stat2_redress_impact")
