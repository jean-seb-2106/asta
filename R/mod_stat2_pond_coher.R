#' stat2_pond_coher UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_coher_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemg",
          h2("Controles de coh\u00e9rence interne"),
          fluidRow(
            column(4,
                   
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      tags$p("Choix des variables \u00e0 croiser", style = "font-size : 110%;"),
                     selectInput(ns("Varcontrole1"), 
                                 "Variable 1",
                                 choices=c("Type de logement"="TYPE_LOG", 
                                           "Presence piscine"="PISCINE_IND", "Pr\u00e9sence jardin"="JARDIN_INDIC"), selected = "JARDIN_INDIC"),
                     selectInput(ns("Varcontrole2"), 
                                 "Variable 2",
                                 choices=c("Type de logement"="TYPE_LOG", 
                                           "Presence piscine"="PISCINE_IND", "Pr\u00e9sence jardin"="JARDIN_INDIC"), selected = "PISCINE_IND"),
                    
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats")),
                   
                   wellPanel(span("Les contr\u00f4les de coh\u00e9rence interne  :", style="color:blue"), 
                             " il fait intervenir plusieurs variables simultan\u00e9ment d'un m\u00eame questionnaire. Il peut \u00eatre logique, ou issu de r\u00e8gles \u00e9dict\u00e9es dans le cadre du domaine \u00e9tudi\u00e9. Il vise \u00e0 v\u00e9rifier que les r\u00e9ponses d'un enqu\u00eat\u00e9 sont coh\u00e9rentes entre elles."),
                             
            ),
            column(8,
                   wellPanel(
                     tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     tableOutput(ns("tab1")),br(),
                     tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
            )
                   
                   
                   
          )
  )
  
  
  
}
    
#' stat2_pond_coher Server Functions
#'
#' @noRd 
mod_stat2_pond_coher_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt_apur = grandile_apur)
    
    local <- reactiveValues(
      dt=NULL)
    
    observeEvent(input$go,{
      local$dt <- global$dt_apur
      local$var1 <- input$Varcontrole1
      local$var2 <- input$Varcontrole2
     
      local$table <- table(global$dt_apur[,input$Varcontrole1],global$dt_apur[,input$Varcontrole2])
      
    })
    
    output$tab1 <- renderTable({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
  
       t <- local$table %>% as.data.frame()
       t <- t %>% rename_at("Var1", ~ input$Varcontrole1) %>% 
         rename_at("Var2", ~ input$Varcontrole2) %>% 
         rename_at("Freq", ~"Fr\u00e9quence")
       
       
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat2_pond_coher_ui("stat2_pond_coher")
    
## To be copied in the server
# mod_stat2_pond_coher_server("stat2_pond_coher")
