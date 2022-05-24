#' stat3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat3_ui <- function(id){
  ns <- NS(id)

  tabPanel(title = "Stat 3",
           
           dashboardPage(
             
             dashboardHeader(title = "Analyse exploratoire de donn\u00e9es"),
             dashboardSidebar(
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "tabs_regression",
                                    
                                    
                                    
                                    menuItem(
                                      
                                      "M\u00e9thodes factorielles",
                                      icon = icon("th"),
                                      selected = FALSE,
                                      menuSubItem("ACP", 
                                                  tabName = "acp"),
                                      menuSubItem("AFC", 
                                                  tabName = "afc"),
                                      menuSubItem("ACM", 
                                                  tabName = "acm")
                                      
                                      
                                    ),
                                    menuItem(
                                      
                                      "Classification",
                                      icon = icon("th"),
                                      selected = FALSE,
                                      menuSubItem("CAH", 
                                                  tabName = "cah"),
                                      menuSubItem("AD", 
                                                  tabName = "ad"),
                                      menuSubItem("K-means", 
                                                  tabName = "kmeans")
                                      
                                      
                                    )
                                    
                                    
                        )
                        
                        
                        
                        
                        
               ),
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
               )),
             dashboardBody(
               
               tabItems(
                 
                 
                 tabItem(
                   tabName = "acp",
                   mod_stat3_acp_ui(ns("stat3_acp_1")), 
                 ),
                 tabItem(
                   tabName = "cah",
                   mod_stat3_cah_ui(ns("stat3_cah_1")), 
                 ),
                 tabItem(
                   tabName = "kmeans",
                   mod_stat3_kmeans_ui(ns("stat3_kmeans_1")), 
                 )
                 
               )
               
               
             )
             
             
             
           )
           
           )
  
  
}
    
#' stat3 Server Functions
#'
#' @noRd 
mod_stat3_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(data = grandile)
    
    mod_stat3_acp_server("stat3_acp_1", global=global)
    mod_stat3_cah_server("stat3_cah_1", global=global) 
    mod_stat3_kmeans_server("stat3_kmeans_1", global=global)
  })
}
    
## To be copied in the UI
# mod_stat3_ui("stat3_ui")
    
## To be copied in the server
# mod_stat3_server("stat3_ui")
