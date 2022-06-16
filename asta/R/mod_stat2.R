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
      
      
      fluidRow(
        collapsed = FALSE,
        sidebarMenu(
          id = "tabs", # à quoi sert cet identifiant ??
          
          
          menuItem(
            "D\u00e9finitions",
            tabName = "definitions",
            icon = icon("th"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Sondages",
            icon = icon("th"),
            menuSubItem("Sondage Al\u00e9atoire Simple", 
                        tabName = "subitema"),
            menuSubItem("Sondage Al\u00e9atoire Stratifi\u00e9", 
                        tabName = "subitemb"),
            menuSubItem("Sondage \u00e0 2 degr\u00e9s", 
                        tabName = "subitemc"),
            menuSubItem("Sondage en grappes", 
                        tabName = "subitemd"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Apurements",
            icon = icon("th"),
            menuSubItem("Base des r\u00e9pondants", 
                        tabName = "subiteme"),
            menuSubItem("Contr\u00f4les univari\u00e9s", 
                        tabName = "subitemf"),
            menuSubItem("Contr\u00f4le de coh\u00e9rence interne",
                        tabName = "subitemg"),
            menuSubItem("Contr\u00f4les de vraissemblance", 
                        tabName = "subitemh"),
            menuSubItem("Contr\u00f4les agr\u00e9g\u00e9s", 
                        tabName = "subitemi"),
            selected = FALSE
          ),
          
          
          menuItem(
            "Redressement",
            icon = icon("th"),
            menuSubItem("Analyse de la non r\u00e9ponse", 
                        tabName = "subitemj"),
            menuSubItem("Etude corr\u00e9lation non r\u00e9ponse", 
                        tabName = "subitemk"),
            menuSubItem("Redressement et impact", 
                        tabName = "subiteml"),
            selected = FALSE
          )
          
          
        )
      ),br(),
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
        
        
        tabItem(
          tabName = "definitions",
          h2("D\u00e9finitions"),
          br(),
          strong("Base de sondage"),br(),
          p("Liste d'individus statistiques, si possible exhaustive et sans double compte dans laquelle on va pouvoir tirer un \u00e9chantillon \u00e0 enqu\u00eater."),
          br(),
          strong("Biais"), br(),
          p("Erreur syst\u00e9matique qui peut s'introduire dans une enqu\u00eate. Il peut apparaitre lors de diff\u00e9rentes phases d'une enqu\u00eate (\u00e9chantillonnage, questionnaire, collecte) et donc il en existe de diff\u00e9rentes natures."),
          br(),
          strong("Echantillon repr\u00e9sentatif"), br(),
          p("Echantillon qui permet d'estimer les indicateurs \u00e9tudi\u00e9s (une moyenne, une proportion, une somme) avec une pr\u00e9cision acceptable \u00e9tant donn\u00e9 les objectifs de l'enqu\u00eate."),
          br(),
          strong("Echantillonnage"), br(),
          p("S\u00e9lection des unit\u00e9s \u00e0 enqu\u00eater. Cette s\u00e9lection s'effectue selon une m\u00e9thode de sondage (sondage probabiliste, sondage par quotas, etc. ...)."),
          br(),
          strong("Population m\u00e8re"), br(),
          p("Ensemble des individus (au sens statistique) qui entrent dans le champ de l'enqu\u00eate."),
          br(),
          strong("Pr\u00e9cision"), br(),
          p("Dispersion de l'\u00e9cart entre ce qui est mesur\u00e9  \u00e0 partir de l'\u00e9chantillonnage et la r\u00e9alit\u00e9 qui serait mesur\u00e9e dans la population m\u00e8re."),
          br(),
          strong("Taux de couverture"), br(),
          p("Rapport entre le nombre d'individus pr\u00e9sents dans la base de sondage et le nombre d'individus dans la population m\u00e8re."),
          br(),
          strong("Variables d'int\u00e9r\u00eat"), br(),
          p(" Variables qui sont l'objet de l'\u00e9tude statistique et que cherche \u00e0 mesurer l'enqu\u00eate."),
          br(),
          strong("Variables auxiliaires"), br(),
          p("Variables pr\u00e9sentes dans la base de sondage avant enqu\u00eate (donn\u00e9es administratives, .).")
        
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
