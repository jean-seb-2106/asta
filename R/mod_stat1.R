#' stat1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shinipsum random_DT random_ggplot random_table random_ggplotly
#' @importFrom DT renderDT DTOutput
#' @importFrom plotly plotlyOutput renderPlotly
mod_stat1_ui <- function(id){
  ns <- NS(id)

    
tabPanel(
  
  "Stat 1",
  
  dashboardPage(
    
    
    #dashboardHeader---------
    dashboardHeader(
      title = "Statistiques descriptives et inferentielles",
      titleWidth = 450,
      disable = FALSE
    ),
    
    #dashboardSidebar--------
    dashboardSidebar(
      fluidRow(
        collapsed = FALSE,
        
        sidebarMenu(
          id = "tabs", 
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
            menuSubItem("Caractere qualitatif", tabName = "subitem3"),
            menuSubItem("Caractere quantitatif", tabName = "subitem4"),
            selected = FALSE
          ),
          menuItem(
            "Statistique bivariee",
            icon = icon("th"),
            menuSubItem("Quanti-Quanti", tabName = "subitem5"),
            menuSubItem("Quali-Quali", tabName = "subitem6"),
            menuSubItem("Quali-Quanti", tabName = "subitem7"),
            selected = FALSE
          ),
          menuItem(
            "Statistique inferentielle",
            icon = icon("th"),
            menuSubItem("Estimations", tabName = "subitem8"),
            menuSubItem("Simulations", tabName = "subitem9"),
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
        fluidRow(
          href = 'https://www.cefil.fr/',
          tags$img(
            src = 'logo_cefil_new.jpg',
            title = "CEFIL",
            height = '105'
          ) ,
          style = "text-align: center;"
        )
      )
    ),
    
    #dashboardBody--------
    dashboardBody(
      
      
      tabItems(
        
        #Les données--------
        tabItem(tabName = "subitem1",
                h2("Le fichier Grandile"),
                DT::DTOutput(ns('dt1'))),

        tabItem(tabName = "subitem2",
                h2("Dictionnaire des variables")),
        
        #Statistique univariée quali---------
        #tabItem("subitem3")
        mod_stat1_uni_quali_ui(ns("stat1_uni_quali")),
                
        
        #Stat univariée quanti----
        #tabitem("subitem4")
        mod_stat1_uni_quanti_ui(ns("stat1_uni_quanti")),
        
        #Statistique bivariée--------
        #tabitem("subitem5")
        mod_stat1_bi_quantiquanti_ui(ns("stat1_bi_quantiquanti")),
        #tabitem("subitem6")
        mod_stat1_bi_qualiquali_ui(ns("stat1_bi_qualiquali")),
        #tabitem("subitem7")
        mod_stat1_bi_quantiquali_ui(ns("stat1_bi_quantiquali")),
        
        #Statistique inférentielle---------
        
        mod_stat1_inf_estimations_ui(ns("stat1_inf_estimations")),
        mod_stat1_inf_simulations_ui(ns("stat1_inf_simulations")),
        mod_stat1_inf_intervalles_ui(ns("stat1_inf_intervalles")),
        mod_stat1_inf_tests_ui(ns("stat1_inf_tests"))
        
        
        
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
 
    #les données----
    
    output$dt1 <- renderDT({
      
      random_DT(ncol = 10,nrow = 5418)
      
    })
    
    #Stat univariée quali-------
    mod_stat1_uni_quali_server("stat1_uni_quali")
    
    #Stat univariée quanti-----
    mod_stat1_uni_quanti_server("stat1_uni_quanti")
    
    #Stat bivariée quanti-quanti----------
    mod_stat1_bi_quantiquanti_server("stat1_bi_quantiquanti")
    
    #Stat bivariée quali-quali------
    mod_stat1_bi_qualiquali_server("stat1_bi_qualiquali")
    
    #Stat bivariée quanti-quali------
    mod_stat1_bi_quantiquali_server("stat1_bi_quantiquali")
    
    #Stat inférentielle estimations ponctuelles--------
    mod_stat1_inf_estimations_server("stat1_inf_estimations")
    
    #Stat inférentielle simulation de tirages------
    mod_stat1_inf_simulations_server("stat1_inf_simulations")
    
    #Stat inférentielle : intervalles de confiance-----
    mod_stat1_inf_intervalles_server("stat1_inf_intervalles")
    
    #Stat inférentielle : tests statistiques-----
    mod_stat1_inf_tests_server("stat1_inf_tests")
    
  })
}
    
## To be copied in the UI
# mod_stat1_ui("stat1_ui_1")
    
## To be copied in the server
# mod_stat1_server("stat1_ui_1")
