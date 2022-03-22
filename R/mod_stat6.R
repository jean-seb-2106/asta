#' stat6 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat6_ui <- function(id){
  ns <- NS(id)

  tabPanel(title = "Stat 6",
           
           dashboardPage(
             
             dashboardHeader(title = "Secret statistique et Big Data"),
             dashboardSidebar(
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "tabs_secretstat",
                                    
                                    
                                    
                                    menuItem(
                                      
                                      "Secret Statistique",
                                      icon = icon("th"),
                                      selected = FALSE), 
                                    
                                    menuItem(
                                             
                                             "Big Data",
                                             icon = icon("th"),
                                             selected = FALSE
                                             
                                             
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
               )
             ),
             dashboardBody()
             
             
             
           )
           
           
           )
  
  
}
    
#' stat6 Server Functions
#'
#' @noRd 
mod_stat6_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat6_ui("stat6_ui")
    
## To be copied in the server
# mod_stat6_server("stat6_ui")
