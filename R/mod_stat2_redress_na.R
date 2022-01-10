#' stat2_redress_na UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_na_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemj",
          h2("Analyse de la non r\u00e9ponse"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable \u00e0 \u00e9tudier",
                                 choices=c("Activité"="ACT", "PCS"="PCS", "Type de logement"="TYPE_LOG")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats"))
                   ),
            
            column(8,
                   
                   fluidRow(
            column(6,
                   
                   
                   infoBox(
                     title = "Nb ind.  \u00e9chantillonn\u00e9s",
                     value = textOutput(ns("nb_ech")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("buromobelexperte"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ) ,
                   infoBox(
                     title = "Taux sondage global",
                     value = textOutput(ns("taux_sond")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("buromobelexperte"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ) 
                   
            ),
            column(6,
                   
                   infoBox(
                     title = "Nb ind.  r\u00e9pondants",
                     value = textOutput(ns("nb_rep")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = "Taux r\u00e9ponse global",
                     value =textOutput(ns("taux_rep")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   )
            )),
            fluidRow(
            
            
            column(width=12,
                   
                  wellPanel(
                    tags$p("Tableau", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                    
                    tableOutput(ns("tab1")),br(),
                    tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                    
                  )  )
            )
  )
  )
  )
  
}
    
#' stat2_redress_na Server Functions
#'
#' @noRd 
mod_stat2_redress_na_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    global <- reactiveValues(dt_apur = grandile_redress)
    
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
    
        local$dt <- global$dt_apur 
        local$var <- input$Varcontrole
    }) 
    
    
    
    output$nb_ech <- renderText({
      req(local$dt)
      local$nb_ech <- sum(local$dt[, "ECH"], na.rm = TRUE)
      
    })
    
    output$nb_rep <- renderText({
      req(local$dt)
      local$nb_rep <- sum(local$dt[, "REPONDANT"], na.rm = TRUE)
      
    })
    
    output$taux_sond <- renderText({
      req(local$dt)
      local$taux_sond <- paste0(round((sum(local$dt[, "ECH"], na.rm = TRUE)/ nrow(local$dt))*100,1), " %")
      
    })
    
    output$taux_rep <- renderText({
      req(local$dt)
      local$taux_rep <- paste0(round((sum(local$dt[, "REPONDANT"], na.rm = TRUE)/ sum(local$dt[, "ECH"], na.rm = TRUE))*100,1)," %")
      
    })
 
    output$tab1 <- renderTable({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau")
      )
   
  
      t <- local$dt %>%   
        group_by(.data[[local$var]]) %>%
        summarise(repondants = sum(REPONDANT, na.rm = TRUE),
                  echantillonnes =  sum(ECH, na.rm = TRUE)) %>%
        mutate(taux_reponse = paste(round((
          repondants / echantillonnes
        ) * 100, 1), " %")) %>% 
        rename("R\u00e9pondants" = repondants , "Echantillon\u00e9s" = echantillonnes )
      
      
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat2_redress_na_ui("stat2_redress_na")
    
## To be copied in the server
# mod_stat2_redress_na_server("stat2_redress_na")
