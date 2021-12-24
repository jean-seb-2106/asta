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
          h2("Controles de cohérence interne"),
          fluidRow(
            column(4,
                   
                   
                   wellPanel(
                     tags$p("Paramètres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                      tags$p("Choix des variables à croiser", style = "font-size : 110%;"),
                     selectInput(ns("Varcontrole1"), 
                                 "Variable 1",
                                 choices=c("Type de logement"="TYPE_LOG", 
                                           "Presence piscine"="PISCINE_IND", "Presence jardin"="JARDIN_INDIC"), selected = "JARDIN_INDIC"),
                     selectInput(ns("Varcontrole2"), 
                                 "Variable 2",
                                 choices=c("Type de logement"="TYPE_LOG", 
                                           "Presence piscine"="PISCINE_IND", "Presence jardin"="JARDIN_INDIC"), selected = "PISCINE_IND"),
                    
                     actionButton(inputId=ns("go"),"Mettre à jour les résultats")),
                   
                   wellPanel(span("Les contrôles de cohérence interne  :", style="color:blue"), 
                             " il fait intervenir plusieurs variables simultanément d'un même questionnaire. Il peut être logique, ou issu de règles édictées dans le cadre du domaine étudié. Il vise à vérifier que les réponses d'un enquêté sont cohérentes entre elles."),
                             
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
                    message = "Choisissez une variable dans le menu déroulant et cliquez pour afficher le tableau"))
  
       t <- local$table %>% as.data.frame()
       t <- t %>% rename_at("Var1", ~ input$Varcontrole1) %>% 
         rename_at("Var2", ~ input$Varcontrole2) %>% 
         rename_at("Freq", ~"Fréquence")
       
       
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat2_pond_coher_ui("stat2_pond_coher")
    
## To be copied in the server
# mod_stat2_pond_coher_server("stat2_pond_coher")
