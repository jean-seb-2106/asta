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
             
             dashboardHeader(title = "Machine Learning"),
             dashboardSidebar(
               fluidRow(collapsed = FALSE,
                        
                        
                        sidebarMenu(id = "classif_regression",
                                    
                                    
                                    
                                    menuItem(tabName = "classif",
                                      
                                      "Classification supervis\u00e9e",
                                      menuSubItem("Donn\u00e9es", tabName = "subitem__1"),
                                      menuSubItem("Pr\u00e9paration", tabName = "subitem__2"),
                                      menuSubItem("Modèle", tabName = "subitem__3"),
                                      menuSubItem("Validation", tabName = "subitem__4"),
                                      menuSubItem("G\u00e9n\u00e9ralisation", tabName = "subitem__5"),
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ), 
                                    
                                    menuItem(tabName = "regression",
                                             
                                             "R\u00e9gression",
                                             menuSubItem("Donn\u00e9es", tabName = "subitem__6"),
                                             menuSubItem("Pr\u00e9paration", tabName = "subitem__7"),
                                             menuSubItem("Modèle", tabName = "subitem__8"),
                                             menuSubItem("Validation", tabName = "subitem__9"),
                                             menuSubItem("G\u00e9n\u00e9ralisation", tabName = "subitem__10"),
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
             dashboardBody(
               
               tabItems(
               
               
                 mod_stat6_classif_donnees_ui(ns("stat6_classif_donnees")),
                 mod_stat6_classif_preparation_ui(ns("stat6_classif_preparation")),
                 mod_stat6_classif_modele_ui(ns("stat6_classif_modele"))
             
             
             
             )
             
             
             
           )
           
           
           ))
  
  
}
    
#' stat6 Server Functions
#'
#' @noRd 
mod_stat6_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    global <- reactiveValues(dt = NULL,
                             rec = NULL,
                             mod = NULL,
                             wflow = NULL,
                             fit = NULL)
    
    mod_stat6_classif_donnees_server("stat6_classif_donnees",global=global)
    mod_stat6_classif_preparation_server("stat6_classif_preparation",global = global)
    mod_stat6_classif_modele_server("stat6_classif_modele",global=global)
 
  })
}
    
## To be copied in the UI
# mod_stat6_ui("stat6_ui")
    
## To be copied in the server
# mod_stat6_server("stat6_ui")
