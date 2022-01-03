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
            menuSubItem("Sondage Aléatoire Simple", 
                        tabName = "subitema"),
            menuSubItem("Sondage aléatoire Stratifié", 
                        tabName = "subitemb"),
            menuSubItem("Sondage à 2 degrés", 
                        tabName = "subitemc"),
            menuSubItem("Sondage en grappes", 
                        tabName = "subitemd"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Ponderation",
            icon = icon("th"),
            menuSubItem("Base des répondants", 
                        tabName = "subiteme"),
            menuSubItem("Contrôles univariés", 
                        tabName = "subitemf"),
            menuSubItem("Contrôle de cohérence interne",
                        tabName = "subitemg"),
            menuSubItem("Controles de vraissemblance", 
                        tabName = "subitemh"),
            menuSubItem("Contrôles agrégés", 
                        tabName = "subitemi"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Redressement",
            icon = icon("th"),
            menuSubItem("Analyse de la non reponse", 
                        tabName = "subitemj"),
            menuSubItem("Etude corrélation non reponse", 
                        tabName = "subitemk"),
            menuSubItem("Redressement et impact", 
                        tabName = "subiteml"),
            selected = FALSE
          )
          
          
        )
      ),
      fluidRow(
        br(),br(),
      HTML('<center> <img src="logo_cefil.jpg" width ="80" > </center>')
      
      
      
      )
      
    ),
    dashboardBody(
      
      
      tabItems(
        
        
        tabItem(
          tabName = "definitions",
          h2("Definitions"),
          br(),
          strong("Base de sondage"),br(),
          p("Liste d'individus statistiques, si possible exhaustive et sans double compte dans laquelle on va pouvoir tirer un échantillon à enquêter."),
          br(),
          strong("Biais"), br(),
          p("Erreur systématique qui peut s'introduire dans une enquête. Il peut apparaitre lors de différentes phases d'une enquête (échantillonnage, questionnaire, collecte) et donc il en existe de différentes natures."),
          br(),
          strong("Echantillon représentatif"), br(),
          p("Echantillon qui permet d'estimer les indicateurs étudiés (une moyenne, une proportion, une somme) avec une précision acceptable étant donné les objectifs de l'enquête."),
          br(),
          strong("Echantillonnage"), br(),
          p("Sélection des unités à enquêter. Cette sélection s'effectue selon une méthode de sondage (sondage probabiliste, sondage par quotas, etc. ...)."),
          br(),
          strong("Population mère"), br(),
          p("Ensemble des individus (au sens statistique) qui entrent dans le champ de l'enquête."),
          br(),
          strong("Précision"), br(),
          p("Dispersion de l'écart entre ce qui est mesuré  à partir de l'échantillonnage et la réalité qui serait mesurée dans la population mère."),
          br(),
          strong("Taux de couverture"), br(),
          p("Rapport entre le nombre d'individus présents dans la base de sondage et le nombre d'individus dans la population mère."),
          br(),
          strong("Variables d'intérêt"), br(),
          p(" Variables qui sont l'objet de l'étude statistique et que cherche à mesurer l'enquête."),
          br(),
          strong("Variables auxiliaires"), br(),
          p("Variables présentes dans la base de sondage avant enquête (données administratives, .).")
        
        ),
        
        #tabItem("subitema")
        mod_stat2_sond_sas_ui(ns("stat2_sond_sas")), 
        
        mod_stat2_sond_saf_ui(ns("stat2_sond_saf")),
        
        mod_stat2_sond_2deg_ui(ns("stat2_sond_2deg")),
        
        mod_stat2_sond_grappes_ui(ns("stat2_sond_grappes")),
        
        
        mod_stat2_pond_base_ui(ns("stat2_pond_base")),
        
        mod_stat2_pond_univ_ui(ns("stat2_pond_univ")),
        
        mod_stat2_pond_coher_ui(ns("stat2_pond_coher")),
        
        mod_stat2_pond_vraiss_ui(ns("stat2_pond_vraiss")),
        
        mod_stat2_pond_agreg_ui(ns("stat2_pond_agreg")),
        
        mod_stat2_redress_na_ui(ns("stat2_redress_na")),
        
        mod_stat2_redress_corrna_ui(ns("stat2_redress_corrna")),
        
        mod_stat2_redress_impact_ui(ns("stat2_redress_impact"))
        
      )
      
      
      
      
    )
    
    
  )
  
  
  
  
  
  
  
)
    
    
    
  
}
    
#' stat2 Server Functions
#'
#' @noRd 
mod_stat2_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(data = grandile)
    
    
    mod_stat2_sond_sas_server("stat2_sond_sas", global=global)
    
    mod_stat2_sond_saf_server("stat2_sond_saf", global=global)
    
    mod_stat2_sond_2deg_server("stat2_sond_2deg", global=global)
    
    mod_stat2_sond_grappes_server("stat2_sond_grappes", global=global)
    
    mod_stat2_pond_base_server("stat2_pond_base", global=global)
    
    mod_stat2_pond_univ_server("stat2_pond_univ", global=global)
    
    mod_stat2_pond_coher_server("stat2_pond_coher", global=global)
    
    mod_stat2_pond_vraiss_server("stat2_pond_vraiss", global=global)
    
    mod_stat2_pond_agreg_server("stat2_pond_agreg", global=global)
    
    mod_stat2_redress_na_server("stat2_redress_na", global=global)
    
    mod_stat2_redress_corrna_server("stat2_redress_corrna", global=global)
    
    mod_stat2_redress_impact_server("stat2_redress_impact", global=global)
    
  })
}
    
## To be copied in the UI
# mod_stat2_ui("stat2_ui_1")
    
## To be copied in the server
# mod_stat2_server("stat2_ui_1")
