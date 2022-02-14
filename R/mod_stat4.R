#' stat4 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_ui <- function(id){
  ns <- NS(id)
  
  
  tabPanel(title = "Stat 4",
           
           
           dashboardPage(
             
             dashboardHeader(title = "R\u00e9gression"),
             dashboardSidebar(
               
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "tabs_regression",
                                    
                                    
                                    
                                    menuItem(
                                      
                                      "R\u00e9gressions lineaires",
                                      icon = icon("th"),
                                      selected = FALSE,
                                      menuSubItem("R\u00e9gressions lineaires Simple", 
                                                  tabName = "subitema"),
                                      menuSubItem("R\u00e9gressions lineaires multiples", 
                                                  tabName = "subitemb")
                                      
                                      
                                    ), 
                                    
                                    menuItem(
                                      
                                      "R\u00e9gressions non lineaires",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ),
                                    
                                    menuItem(
                                      
                                      "R\u00e9gressions logistiques",
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
    
#' stat4 Server Functions
#'
#' @noRd 
mod_stat4_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_stat4_ui("stat4_ui")
    
## To be copied in the server
# mod_stat4_server("stat4_ui")
