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

  tabPanel(title = "Stat 5",
           
           
           dashboardPage(
             
             dashboardHeader(title = "S\u00e9ries temporelles"),
             dashboardSidebar(
               
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "tabs_seriestemps",
                                    
                                    
                                    
                                    
                                    menuItem(
                                      
                                      "Analyse de la s\u00e9rie",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ),
                                    
                                    menuItem(
                                      
                                      "D\u00e9saisonalisation",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ),
                                    
                                    menuItem(
                                      
                                      "Pr\u00e9visions",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    )
                                    
                                    
                                    )
                 
                 
                 
                 
                 
               )
               
               
             ),
             dashboardBody()
             
             
             
           )
           
           
           
           )
  
  
}
    
#' stat5 Server Functions
#'
#' @noRd 
mod_stat5_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat5_ui("stat5_ui")
    
## To be copied in the server
# mod_stat5_server("stat5_ui")
