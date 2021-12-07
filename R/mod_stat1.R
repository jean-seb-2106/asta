#' stat1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shinipsum random_DT
#' @importFrom DT renderDT DTOutput
mod_stat1_ui <- function(id){
  ns <- NS(id)

    
tabPanel(
  
  "Stat 1",
  
  dashboardPage(
    
    
    
    dashboardHeader(
      title = "Statistiques descriptives et inferentielles",
      titleWidth = 450,
      disable = FALSE
    ),
    
    
    dashboardSidebar(
      fluidRow(
        collapsed = FALSE,
        
        sidebarMenu(
          id = "tabs", #à quoi sert l'identifiant du menu ???
          menuItem(
            "Donnees",
            menuSubItem("Visualisation de la base", tabName = "subitem1"),
            menuSubItem("Dictionnaire des variables", tabName = "subitem2"),
            icon = icon("th"),
            selected = FALSE
          ),
          menuItem(
            "Statistique univariee",
            icon = icon("th"),
            menuSubItem("caractere quali", tabName = "subitem3"),
            menuSubItem("caractere quanti", tabName = "subitem4"),
            selected = FALSE
          ),
          menuItem(
            "Statistique bivariee",
            icon = icon("th"),
            menuSubItem("quali-quali", tabName = "subitem5"),
            menuSubItem("quanti-quanti", tabName = "subitem6"),
            menuSubItem("quali-quanti", tabName = "subitem7"),
            selected = FALSE
          ),
          menuItem(
            "Statistique inferentielle",
            icon = icon("th"),
            menuSubItem("Estimations", tabName = "subitem8"),
            menuSubItem("Tirage de l'echantillon", tabName = "subitem9"),
            menuSubItem("Intervalles de confiance", tabName = "subitem10"),
            menuSubItem("Tests statistiques", tabName = "subitem11"),
            # tabName = "inferentielle",
            # badgeColor = "green",
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
        br(),
        br(),
        br(),
        fluidRow(
          href = 'https://www.cefil.fr/',
          tags$img(
            src = 'logo_cefil.jpg',
            title = "CEFIL",
            height = '105'
          ) ,
          style = "text-align: center;"
        )
      )
    ),
    
    
    dashboardBody(
      
      
      tabItems(
        
        #Les données
        
        tabItem(tabName = "subitem1",
                h2("Le fichier Grandile"),
                DT::DTOutput(ns('tab1'))),
        
        tabItem(tabName = "subitem2",
                h2("Dictionnaire des variables")),
        
        #Statistique univariée
        
        tabItem(tabName = "subitem3",
                h2("subitem3")),
        
        tabItem(tabName = "subitem4",
                h2("subitem4")),
        
        #Statistique bivariée
        
        tabItem(tabName = "subitem5",
                h2("subitem5")),
        tabItem(tabName = "subitem6",
                h2("subitem6")),
        tabItem(tabName = "subitem7",
                h2("subitem7")),
        
        #Statistique inférentielle
        
        tabItem(tabName = "subitem8",
                h2("subitem8")),
        tabItem(tabName = "subitem9",
                h2("subitem9")),
        tabItem(tabName = "subitem10",
                h2("subitem10")),
        tabItem(tabName = "subitem11",
                h2("subitem11"))
        
        
        # tabItem(
        # 
        # 
        # 
        #   tabName = "inferentielle",
        #   h2("Statistique Inferentielle"),
        #   tabsetPanel(
        #     tabPanel("Estimations"),
        #     tabPanel("Tirage de l'echantillon"),
        #     tabPanel("Intervalles de confiance"),
        #     tabPanel("Tests statistiques")
        # 
        # 
        #   )
        # )
        
      )
      
      
      
      
    )
    
  )
  
  
  
  

    
    
    
    
  )
}
    
#' stat1 Server Functions
#'
#' @noRd 
mod_stat1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$tab1 <- renderDT({
      
      random_DT(ncol = 10,nrow = 5418)
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_ui("stat1_ui_1")
    
## To be copied in the server
# mod_stat1_server("stat1_ui_1")
