#' stat3_acp UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat3_acp_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "acp",
            h2("Analyse en Composantes Principales"),
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
                              
                              
                              
                              checkboxInput(inputId=ns("constante"), "Retirer la constante", value = FALSE, width = NULL),
                              
                              actionButton(inputId=ns("go"),"Mettre \u00e0 jour")),
                            
                            wellPanel(
                              tags$p("Décomposition de l'inertie", style = "font-size : 110%; font-weight : bold; text-decoration : underline;")
                              ,
                              verbatimTextOutput(ns("coeffcorr")),br(),
                             
                              br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
                     ),
                     
                     column(8,
                            
                            wellPanel(
                              tags$p("Graphe des variables", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              plotOutput(ns("arbre")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            ),wellPanel(
                              tags$p("Graphe des individus", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              verbatimTextOutput(ns("classes")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;"))
                            
                            
                     )
            )
    )
    
    
  )
}
    
#' stat3_acp Server Functions
#'
#' @noRd 
mod_stat3_acp_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat3_acp_ui("stat3_acp_1")
    
## To be copied in the server
# mod_stat3_acp_server("stat3_acp_1")
