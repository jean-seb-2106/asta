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
#' @importFrom DT renderDT DTOutput datatable
#' @importFrom plotly plotlyOutput renderPlotly
mod_stat1_ui <- function(id){
  ns <- NS(id)

    
tabPanel(
  
  "Stat 1",
  
  dashboardPage(
    
    
    #dashboardHeader---------
    dashboardHeader(
      title = "Statistiques descriptives et inf\u00e9rentielles",
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
            menuSubItem("Visualisation", tabName = "subitem1"),
            menuSubItem("Description", tabName = "subitem2"),
            icon = icon("th"),
            selected = FALSE
          ),
          menuItem(
            "Statistique univari\u00e9e",
            icon = icon("th"),
            menuSubItem("Caract\u00e8re qualitatif", tabName = "subitem3"),
            menuSubItem("Caract\u00e8re quantitatif", tabName = "subitem4"),
            selected = FALSE
          ),
          menuItem(
            "Statistique bivari\u00e9e",
            icon = icon("th"),
            menuSubItem("Quanti-Quanti", tabName = "subitem5"),
            menuSubItem("Quali-Quali", tabName = "subitem6"),
            menuSubItem("Quali-Quanti", tabName = "subitem7"),
            selected = FALSE
          ),
          menuItem(
            "Statistique inf\u00e9rentielle",
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
                h2("Visualisation du fichier"),
                tags$br(), 
                DT::DTOutput(ns('dt1'))),

        tabItem(tabName = "subitem2",
                h2("Description des donn\u00e9es"),
                tags$br(), 
                fluidRow(
                  column(6,
                         wellPanel(
                           tags$p("Dictionnaire des variables", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                         
                         tags$br(),  
                         h4("IDENT : Identifiant du m\u00e9nage"),
                         h4("MODCOHA : Mode de cohabitation dans le logement"),
                         h4("NBPERS : Nombre de personnes dans le logement"),
                         h4("NBPIECES : Nombre de pi\u00e8ces du logement"),
                         h4("AGE : Âge de la personne de r\u00e9f\u00e9rence"),
                         h4("DIPL : Niveau d'\u00e9tude de la personne de r\u00e9f\u00e9rence"),
                         h4("PCS : Cat\u00e9gorie socio-professionnelle de la personne de r\u00e9f\u00e9rence"),
                         h4("ACT : Secteur d'activit\u00e9 de la personne de r\u00e9f\u00e9rence"),
                         h4("PATRIMOINE : Patrimoine du m\u00e9nage (en \u20ac)"),
                         h4("REV_DISPONIBLE : Revenu disponible du m\u00e9nage (en \u20ac)"),
                         h4("PAUVRE : Le m\u00e9nage est-il pauvre ?")
                         )
                         
                         
                         ),
                  column(6,
                         
                         wellPanel(
                           
                           tags$p("Modalit\u00e9s des caract\u00e8res qualitatifs", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                           tags$br(), 
                         selectInput(
                           ns("select1"),
                           "Choisissez un caract\u00e8re :", 
                           choices=c("MODCOHA"="LIB_MODCOHA",
                                     "DIPL"="LIB_DIPL",
                                     "PCS"="LIB_PCS",
                                     "ACT" = "LIB_ACT",
                                     "PAUVRE" = "LIB_PAUVRE"),
                           selected = "LIB_PCS"
                           ),
                         
                         tableOutput(ns("tab1")
                                     
                                     )
                         
                         )
                         
                         
                         )
                  )
                
                
                
                ),
        
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
mod_stat1_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt = grandile)
    
    #les données----
    
    output$dt1 <- renderDT({
      
     global$dt[,1:11] %>% DT::datatable(class = "display")
      
    })
    
    #Dictionnaire des variables
    output$tab1 <- renderTable({
      t <- grandile %>% arrange(.data[[input$select1]])
      unique(t[,input$select1]) %>% as.data.frame()
      
    })
    
    #Stat univariée quali-------
    mod_stat1_uni_quali_server("stat1_uni_quali",global=global)
    
    #Stat univariée quanti-----
    mod_stat1_uni_quanti_server("stat1_uni_quanti",global=global)
    
    #Stat bivariée quanti-quanti----------
    mod_stat1_bi_quantiquanti_server("stat1_bi_quantiquanti",global=global)
    
    #Stat bivariée quali-quali------
    mod_stat1_bi_qualiquali_server("stat1_bi_qualiquali",global=global)
    
    #Stat bivariée quanti-quali------
    mod_stat1_bi_quantiquali_server("stat1_bi_quantiquali",global=global)
    
    #Stat inférentielle estimations ponctuelles--------
    mod_stat1_inf_estimations_server("stat1_inf_estimations",global=global)
    
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
