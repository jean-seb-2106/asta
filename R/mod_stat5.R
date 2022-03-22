#' stat5 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat5_ui <- function(id){
  ns <- NS(id)

  tabPanel(
    
    title = "Stat 5",
           
           
           dashboardPage(
             
             dashboardHeader(title = "S\u00e9ries temporelles"),
             
             
             dashboardSidebar(
               
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "tabs_seriestemps",
                                    
                                    
                                    
                                    
                                    menuItem(
                                      
                                      "Analyse de la s\u00e9rie",
                                      
                                      menuSubItem("Visualisation", tabName = "subitem_1"),
                                      menuSubItem("Saisonnalit\u00e9", tabName = "subitem_2"),
                                      
                                      
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ),
                                    
                                    menuItem(
                                      
                                      "D\u00e9saisonalisation",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ),
                                    
                                    menuItem(
                                      
                                      "Mod\u00e9lisation",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    )
                                    
                                    
                                    ),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        fluidRow(
                          href = 'https://www.cefil.fr/',
                          tags$img(
                            src = 'www/logo_cefil.jpg',
                            title = "CEFIL",
                            height = '95'
                          ) ,
                          style = "text-align: center; float:bottom;"
                        )
                 
                   )
               
               
             ),
             dashboardBody(
               
               tabItems(
                 
                 #tabItem("subitem1")
                 
                 mod_stat5_analyse_visualisation_ui(ns("stat5_analyse_visualisation")),
                 
                 mod_stat5_analyse_saisonnalite_ui(ns("stat5_analyse_saisonnalite"))
                 
                 
                 
                 
                 
                 
               )
               
               
               
             )
             
             
             
           )
           
           
           
           )
  
  
}
    
#' stat5 Server Functions
#'
#' @noRd 
mod_stat5_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(ts1 = airpass)
    
    mod_stat5_analyse_visualisation_server("stat5_analyse_visualisation",global=global)
    
    mod_stat5_analyse_saisonnalite_server("stat5_analyse_saisonnalite",global=global)
    
    
  })
}
    
## To be copied in the UI
# mod_stat5_ui("stat5_ui")
    
## To be copied in the server
# mod_stat5_server("stat5_ui")
