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
                     value = textOutput("poidsmoyen"),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = "Ecart type des poids",
                     value = textOutput("poidssd"),
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
                              value = textOutput(ns("meanred")),
                              subtitle = "Redressé",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = textOutput(ns("meannonred")),
                              subtitle = "Non redressé",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = textOutput(ns("meanmere")),
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
                              value = textOutput(ns("meanred_pat")),
                              subtitle = "Redressé",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = textOutput(ns("meannonred_pat")),
                              subtitle = "Non redressé",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = textOutput(ns("meanmere_pat")),
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
                              
                              plotOutput(ns("nuageapur")),br(),
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
mod_stat2_redress_impact_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat2_redress_impact_ui("stat2_redress_impact")
    
## To be copied in the server
# mod_stat2_redress_impact_server("stat2_redress_impact")
