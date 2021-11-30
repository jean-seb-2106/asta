#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import dashboardthemes
#' @import shinythemes
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    navbarPage(
      
      shinyDashboardThemes(theme = "grey_light"),
      title = "ASTA",
      
      
      tabPanel(
        "Module 1",
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
                id = "tabs",
                menuItem(
                  "Donnees",
                  # tabName = "donnees",
                  menuSubItem("Visualisation de la base", tabName = "subitem1"),
                  menuSubItem("Dictionnaire des variables", tabName = "subitem2"),
                  icon = icon("dashboard"),
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
                  tabName = "inferentielle",
                  badgeColor = "green",
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
                      DT::DTOutput('tab1')),
              
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
              
              tabItem(
                tabName = "inferentielle",
                h2("Statistique Inferentielle"),
                tabsetPanel(
                  tabPanel("Estimations"),
                  tabPanel("Tirage de l'echantillon"),
                  tabPanel("Intervalles de confiance"),
                  tabPanel("Tests statistiques")
                  
                  
                )
              )
              
            )
          )
          
        )
        
        
        
      ),
      tabPanel("Module 2",
               dashboardPage(
                 dashboardHeader(title = "Sondages", disable = FALSE),
                 dashboardSidebar(
                   collapsed = FALSE,
                   fluidRow(
                     sidebarMenu(
                       id = "tabs",
                       menuItem(
                         "Definitions",
                         tabName = "definitions",
                         icon = icon("dashboard"),
                         selected = FALSE
                       ),
                       menuItem(
                         "Sondages",
                         icon = icon("th"),
                         menuSubItem("sondage aleatoire simple", tabName = "subitem6"),
                         menuSubItem("sondage aleatoire stratifie", tabName = "subitem7"),
                         menuSubItem("sondage a 2 degres", tabName = "subitem8"),
                         menuSubItem("sondage en grappes", tabName = "subitem9"),
                         selected = FALSE
                       ),
                       menuItem(
                         "Ponderation",
                         icon = icon("th"),
                         menuSubItem("base des repondants", tabName = "subitem10"),
                         menuSubItem("controles univaries", tabName = "subitem11"),
                         menuSubItem("controle coherence interne", tabName = "subitem12"),
                         menuSubItem("controle vraissemblance", tabName = "subitem13"),
                         menuSubItem("controles agreges", tabName = "subitem14"),
                         selected = FALSE
                       ),
                       menuItem(
                         "Redressement",
                         icon = icon("th"),
                         menuSubItem("analyse de la non reponse", tabName = "subitem15"),
                         menuSubItem("etude correlation non reponse", tabName = "subitem16"),
                         menuSubItem("redressement et impact", tabName = "subitem17"),
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
                 ),
                 dashboardBody(
                   tabItems(
                     tabItem(
                       tabName = "definitions",
                       h2("Definitions"),
                       textOutput(outputId = "text_definitions")
                     ),
                     tabItem(
                       tabName = "subitem6",
                       h2("Sondage Aleatoire Simple"),
                       fluidRow( column(4,
                                        
                                        wellPanel(
                                          
                                          sliderInput("TailleEch", "Choisissez la taille de l'échantillon",min=10,max=5418,value=0),
                                          selectInput("NomVar","Choisissez un caractère :", choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
                                          selectInput("NomVar","Choisissez un caractère :", choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
                                          actionButton(inputId="go",
                                                       label="Lancer le tirage et les calculs")
                                        ),
                                        wellPanel("texte texte texte texte"),
                                        wellPanel("texte texte texte")
                       ),
                       column(width = 4,
                              
                              
                              valueBox(
                                subtitle = "Cefil 2021" ,
                                value = 150, width = NULL, color= "aqua") ,
                              plotOutput(outputId = "plotsas1")
                              
                       ),
                       column(4,
                              
                              infoBox(title = "mon info box2",
                                      subtitle = "Cefil 2021"
                              ),
                              plotOutput(outputId = "plotsas2")
                       )),
                       
                       hr(),
                       fluidRow(
                         wellPanel(
                           h2("fluidrow")
                         )
                       )
                     ), 
                     
                     
                     
                     
                     
                     
                     
                     
                     tabItem(tabName = "subitem7",
                             h2("subitem7")),
                     tabItem(tabName = "subitem8",
                             h2("subitem8")),
                     tabItem(tabName = "subitem9",
                             h2("subitem9")),
                     tabItem(tabName = "subitem10",
                             h2("base des repondants")),
                     tabItem(tabName = "subitem11",
                             h2("controles univaries")),
                     tabItem(tabName = "subitem12",
                             h2("controles coherence interne")),
                     tabItem(tabName = "subitem13",
                             h2("controles vraissemblance")),
                     tabItem(tabName = "subitem14",
                             h2("controles agreges")),
                     tabItem(tabName = "subitem15",
                             h2("analyse de la non reponse")),
                     tabItem(tabName = "subitem16",
                             h2("etude correlation non reponse")),
                     tabItem(tabName = "subitem17",
                             h2("redressement et impact"))
                     
                   )
                 )
                 
                 
               )), 
      
      tabPanel("Module 3",
               dashboardPage(
                 dashboardHeader(title = "Analyse de donnees", disable = FALSE),
                 dashboardSidebar(),
                 dashboardBody()
               )),
      tabPanel("Module 4",
               dashboardPage(
                 dashboardHeader(title = "Regression", disable = FALSE),
                 dashboardSidebar(),
                 dashboardBody()
               )),
      tabPanel("Module 5",
               dashboardPage(
                 dashboardHeader(title = "Series temporelles", disable = FALSE),
                 dashboardSidebar(),
                 dashboardBody()
               ))
      
      
      
      
      
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'asta'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

