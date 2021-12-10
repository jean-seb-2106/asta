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
    
    mod_stat2_sond_sas_server("stat2_sond_sas")
    
    mod_stat2_sond_saf_server("stat2_sond_saf")
    
    mod_stat2_sond_2deg_server("stat2_sond_2deg")
    
    mod_stat2_sond_grappes_server("stat2_sond_grappes")
    
    mod_stat2_pond_base_server("stat2_pond_base")
    
    mod_stat2_pond_univ_server("stat2_pond_univ")
    
    mod_stat2_pond_coher_server("stat2_pond_coher")
    
    mod_stat2_pond_vraiss_server("stat2_pond_vraiss")
    
    mod_stat2_pond_agreg_server("stat2_pond_agreg")
    
    mod_stat2_redress_na_server("stat2_redress_na")
    
    mod_stat2_redress_corrna_server("stat2_redress_corrna")
    
    mod_stat2_redress_impact_server("stat2_redress_impact")
    
  })
}
    
## To be copied in the UI
# mod_stat2_ui("stat2_ui_1")
    
## To be copied in the server
# mod_stat2_server("stat2_ui_1")
