#' stat2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom shinipsum random_text random_ggplot
mod_stat2_ui <- function(id){
  ns <- NS(id)
 
 
tabPanel(
  
  "Stat 2",
  
  dashboardPage(
    
    
    dashboardHeader(
      title = "Sondages", 
      disable = FALSE),
    
    
    dashboardSidebar(
      
      collapsed = FALSE,
      fluidRow(
        sidebarMenu(
          id = "tabs", # à quoi sert cet identifiant ??
          
          
          menuItem(
            "Definitions",
            tabName = "definitions",
            icon = icon("dashboard"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Sondages",
            icon = icon("th"),
            menuSubItem("sondage aleatoire simple", 
                        tabName = "subitema"),
            menuSubItem("sondage aleatoire stratifie", 
                        tabName = "subitemb"),
            menuSubItem("sondage a 2 degres", 
                        tabName = "subitemc"),
            menuSubItem("sondage en grappes", 
                        tabName = "subitemd"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Ponderation",
            icon = icon("th"),
            menuSubItem("base des repondants", 
                        tabName = "subiteme"),
            menuSubItem("controles univaries", 
                        tabName = "subitemf"),
            menuSubItem("controle coherence interne",
                        tabName = "subitemg"),
            menuSubItem("controle vraissemblance", 
                        tabName = "subitemh"),
            menuSubItem("controles agreges", 
                        tabName = "subitemi"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Redressement",
            icon = icon("th"),
            menuSubItem("analyse de la non reponse", 
                        tabName = "subitemj"),
            menuSubItem("etude correlation non reponse", 
                        tabName = "subitemk"),
            menuSubItem("redressement et impact", 
                        tabName = "subiteml"),
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
          src = 'logo_cefil_new.jpg',
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
          textOutput(outputId = ns("text_definitions"))
        ),
        
        
        tabItem(
          tabName = "subitema",
          h2("Sondage Aleatoire Simple"),
          fluidRow(
            column(4,
                           
                wellPanel(
                             
                     sliderInput("TailleEch", 
                                 "Choisissez la taille de l'échantillon",
                                 min=10,
                                 max=5418,
                                 value=15),
                     selectInput("NomVar1",
                                 "Choisissez un caractère :", 
                                 choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
                     selectInput("NomVar2",
                                 "Choisissez un caractère :", 
                                 choices=c("Revenu Disponible"="REV_DISPONIBLE","Patrimoine"="PATRIMOINE")),
                     actionButton("go",
                                  label="Lancer le tirage et les calculs")
                           ),
                           wellPanel("texte texte texte texte"),
                           wellPanel("texte texte texte")
          ),
          column(4,
                 
                 
                 valueBox(
                   subtitle = "Cefil 2021" ,
                   value = 150, width = NULL, color= "aqua") ,
                 plotOutput(outputId = ns("plotsas1"))
                 
          ),
          column(4,
                 
                 infoBox(title = "mon info box2",
                         subtitle = "Cefil 2021"
                 ),
                 plotOutput(outputId = ns("plotsas2"))
          )),
          
          hr(),
          fluidRow(
            wellPanel(
              h2("fluidrow")
            )
          )
        ), 
        
        
        
        
        
        
        
        
        tabItem(tabName = "subitemb",
                h2("subitem7")),
        tabItem(tabName = "subitemc",
                h2("subitem8")),
        tabItem(tabName = "subitemd",
                h2("subitem9")),
        tabItem(tabName = "subiteme",
                h2("base des repondants")),
        tabItem(tabName = "subitemf",
                h2("controles univaries")),
        tabItem(tabName = "subitemg",
                h2("controles coherence interne")),
        tabItem(tabName = "subitemh",
                h2("controles vraissemblance")),
        tabItem(tabName = "subitemi",
                h2("controles agreges")),
        tabItem(tabName = "subitemj",
                h2("analyse de la non reponse")),
        tabItem(tabName = "subitemk",
                h2("etude correlation non reponse")),
        tabItem(tabName = "subiteml",
                h2("redressement et impact"))
        
      )
      
      
      
      
    )
    
    
  )
  
  
  
  
  
  
  
)
    
    
    
  
}
    
#' stat2 Server Functions
#'
#' @noRd 
mod_stat2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    output$text_definitions <- renderText(
      {
        random_text(nwords = 1500)
        
      }
      
    )
    
    # output$tab1 <- renderDT({
    #   
    #   random_DT(ncol = 8, nrow = 15)
    #   
    # })
    
    output$plotsas1 <- renderPlot(
      
      {
        random_ggplot("boxplot")
      }
    )
    
    output$plotsas2 <- renderPlot(
      
      {
        random_ggplot("boxplot")
      }
    )
    
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_ui("stat2_ui_1")
    
## To be copied in the server
# mod_stat2_server("stat2_ui_1")
