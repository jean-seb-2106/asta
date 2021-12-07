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
    
    
    #Header---------
    dashboardHeader(
      title = "Statistiques descriptives et inferentielles",
      titleWidth = 450,
      disable = FALSE
    ),
    
    #Sidebar--------
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
            menuSubItem("Caractere qualitatif", tabName = "subitem3"),
            menuSubItem("Caractere quantitatif", tabName = "subitem4"),
            selected = FALSE
          ),
          menuItem(
            "Statistique bivariee",
            icon = icon("th"),
            menuSubItem("Quali-Quali", tabName = "subitem5"),
            menuSubItem("Quanti-Quanti", tabName = "subitem6"),
            menuSubItem("Quali-Quanti", tabName = "subitem7"),
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
    
    #Body--------
    dashboardBody(
      
      
      tabItems(
        
        #Les données
        
        tabItem(tabName = "subitem1",
                h2("Le fichier Grandile"),
                DT::DTOutput(ns('dt1'))),
        
        tabItem(tabName = "subitem2",
                h2("Dictionnaire des variables")),
        
        #Statistique univariée quali---------
        
        tabItem(tabName = "subitem3",
                h2("Statistiques univariées sur une variable qualitative"),
                br(),
                br(),
                fluidRow(
                  
                        column(4,
                               
                               wellPanel(
                                 
                                 selectInput(
                                    ns("select1"),
                                    "Choisissez une variable :",
                                    choices = LETTERS),
                                 checkboxGroupInput(
                                   ns("check1"),
                                   "Choisissez un graphique :",
                                   choices = c("a","b")),
                                 actionButton(
                                   ns("go1"),
                                   label = "Cliquez pour afficher")
                                 
                               )
                               
                               
                                ),
                         
                         column(4,
                                
                                tableOutput(ns("tab1"))
                                
                                
                                ),
                         column(4,
                                
                                plotOutput(ns("plot1"))
                                
                                
                                ))),
        
        #Stat univariée quanti----
        
        tabItem(tabName = "subitem4",
                h2("Statistiques univariées sur une variable quantitative"),
                br(),
                br(),
                
                
                fluidRow(column(4, 
                                
                                wellPanel(
                  
                  selectInput(ns("select2"),
                              "Choisissez une variable :",
                              choices = LETTERS),
                  sliderInput(ns("slider1"),
                              "Choisissez le nombre de classes : ",
                              min = 1,
                              max = 30,
                              value = 10),
                  actionButton(ns("go2"),"Cliquez pour afficher")
                  
                  
                )
                                ),
                         column(8,
                                
                  plotlyOutput(ns("plotly1"))
                                
                                
                                )),
                
                
                
                fluidRow(
                  
                  h3("Indicateurs de tendance centrale et de position"),
                         
                         infoBox(
                           title = "Moyenne",
                           value = textOutput(ns("moyenne")),
                           #subtitle = "Moyenne",
                           icon = icon("line-chart"),
                           # fill = TRUE,
                           color="red",
                           width=3
                         ),
                         
                         infoBox(
                           title = "Médiane",
                           value = textOutput(ns("mediane")),
                           #subtitle = "Source : Cefil 2020",
                           icon = icon("line-chart"),
                           #fill = TRUE,
                           color="green",
                           width=3
                         ),
                         
                         #Premier Quartile
                         infoBox(
                           title = "Premier Quartile",
                           value = textOutput(ns("q1")),
                           #subtitle = "Source : Cefil 2020",
                           icon = icon("line-chart"),
                           #fill = TRUE,
                           color="aqua",
                           width=3
                         ),
                         #Troisième Quartile
                         infoBox(
                           title = "Troisième quartile",
                           value = textOutput(ns("q3")),
                           #subtitle = "Source : Cefil 2020",
                           icon = icon("line-chart"),
                           #fill = TRUE,
                           color="aqua",
                           width=3
                         ),
                  
                  h3("Indicateurs de dispersion"),
                  
                  fluidRow(
                    #Etendue
                    infoBox(
                      title = "Etendue",
                      value = textOutput(ns("etendue")),
                      #subtitle = "Source : Cefil 2020",
                      icon = icon("line-chart"),
                      #fill = TRUE,
                      color="aqua",
                      width=3
                    ),
                    #Ecart inter-quartile
                    infoBox(
                      title = "Ecart Interquartile",
                      value = textOutput(ns("iiq")),
                      #subtitle = "Source : Cefil 2020",
                      icon = icon("line-chart"),
                      #fill = TRUE,
                      color="aqua",
                      width=3
                    ),
                    #Ecart-type
                    infoBox(
                      title = "Ecart-type",
                      value = textOutput(ns("sd")),
                      #subtitle = "Source : Cefil 2020",
                      icon = icon("line-chart"),
                      #fill = TRUE,
                      color="aqua",
                      width=3
                    ),
                    #Coefficient de variation
                    infoBox(
                      title = "Coefficient de variation",
                      value = textOutput(ns("cv")),
                      #subtitle = "Source : Cefil 2020",
                      icon = icon("line-chart"),
                      #fill = TRUE,
                      color="aqua",
                      width=3
                    ))
                         
                         
                         
                         )
                
                ),
        
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
 
    #les données----
    
    output$dt1 <- renderDT({
      
      random_DT(ncol = 10,nrow = 5418)
      
    })
    
    #Stat univariée quali-------
    
    output$tab1 <- renderTable({
      
      random_table(nrow = 8,ncol = 4)
      
    })
    
    output$plot1 <- renderPlot({
      
      random_ggplot()
      
    })
    
    
    #Stat univariée quanti-----
    
    output$plotly1 <- renderPlotly({
      
      random_ggplotly()
      
    })
    
    output$moyenne <- renderText({
      
      "10"
      
    })
    
    output$mediane <- renderText({
      
      "10"
      
    })
    
    output$q1 <- renderText({
      
      "10"
      
    })
    
    output$q3 <- renderText({
      
      "10"
      
    })
    
    output$etendue <- renderText({
      
      "10"
      
    })
    
    output$iiq <- renderText({
      
      "10"
      
    })
    
    output$sd <- renderText({
      
      "10"
      
    })
    
    output$cv <- renderText({
      
      paste("10","%")
      
    })
    
    
  })
}
    
## To be copied in the UI
# mod_stat1_ui("stat1_ui_1")
    
## To be copied in the server
# mod_stat1_server("stat1_ui_1")
