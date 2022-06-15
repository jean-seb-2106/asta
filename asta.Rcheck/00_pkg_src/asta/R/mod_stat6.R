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
                        
                        
                        sidebarMenu(id = "secret_bigdata",
                                    
                                    
                                    
                                    menuItem(tabName = "secret",
                                      
                                      "Secret Statistique",
                                      icon = icon("th"),
                                      selected = FALSE
                                      
                                      
                                    ), 
                                    
                                    menuItem(tabName = "big_data",
                                             
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
             dashboardBody(tabItems(
               
               
               tabItem(
                 tabName = "secret",
                 wellPanel(span("Le cadre légal et règlementaire  :", style="color:blue"),br(), br(), 
                           "- La loi n°51-711 du 7 juin 1951 modifiée sur l'obligation, la coordination et le secret
                           en matière de statistiques définit ce qu'est le secret statistique, ses limites et ses conditions",br(),br(),
                 "- Principe 5 du Code de bonnes pratiques de la Statistique Européenne : Le respect de la vie privée ou du secret des affaires
                 des fournisseurs de données, la confidentialité des informations qu'ils communiquent et l'utilisation de 
                 celles-ci à des fns strictement statistiques doivent être absolument ganratis"),
                 wellPanel(span("Le repérage  :", style="color:blue"), br(),br(),
                           "- des règles pour les entreprises (3 unités et 85%)",br(),
                           "- des règles pour les ménages"),
                 wellPanel(span("Les méthodes  :", style="color:blue"), br(),br(),
                           "- restructuration des données (fusion de lignes/colonnes ou redocification de modalités)", br(),
                           "- suppressions primaires et secondaires")
                 
               ),
               tabItem(
                 tabName = "big_data",
                 wellPanel(span("Big Data : un enjeu de taille", style="color:blue"),br(), br(), 
                           "- Des nouvelles données parfois volumineuses ou à haute fréquence, avec des formats variés",br(),br(),
                           "- Des limites et des défis pour l'exploitation",br(),br(),
                           "- Des initiatives à l'Insee et dans le SSP : données de caisse, partenariat Orange Lab, création d'un SSP Lab"),
                 wellPanel(span("Big Data : une définition en 5 V", style="color:blue"),br(), br(), 
                           "- Volume",br(),
                           "- Vitesse",br(),
                           "- Variété",br(),
                           "- Véracité",br(),
                           "- Valeur")
                 
               )
               
             ))
             
             
             
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
