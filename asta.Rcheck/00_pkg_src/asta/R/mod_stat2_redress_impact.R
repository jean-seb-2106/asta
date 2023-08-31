#' stat2_redress_impact UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom stats runif
mod_stat2_redress_impact_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subiteml",
          h2("Redressement et impact"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable sur laquelle redresser",
                                 choices = c("Secteur d'activit\u00e9"="LIB_ACT", "PCS"="LIB_PCS", "diplome"="LIB_DIPL", "Composition du m\u00e9nage"="LIB_MODCOHA","Age personne de ref."="AGE", "Nombre de pieces"="NBPIECES")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour")),
                   
                   infoBox(
                     title = "Moyenne des poids",
                     value = textOutput(ns("moy_poids")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="green",
                     width = NULL
                   ),
                   infoBox(
                     title = "Ecart type des poids",
                     value = textOutput(ns("sd_poids")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="green",
                     width = NULL
                   )
            ),
            
            column(8,
                   
                   fluidRow(
                     column(6,
                            
                            
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = textOutput(ns("rev_mere")),
                              subtitle = "Population m\u00e8re",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = textOutput(ns("rev_nonpond")),
                              subtitle = "Avec non-r\u00e9ponse, non redress\u00e9e",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ) ,
                            infoBox(
                              title = "Rev. Disp. moyen",
                              value = textOutput(ns("rev_pond")),
                              subtitle = "Avec redressement",
                              icon = icon("euro-sign"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                            
                     ),
                     column(6,
                            
                            infoBox(
                              title = "Patrimoine moyen",
                              value = textOutput(ns("pat_mere")),
                              subtitle = "Population m\u00e8re",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = textOutput(ns("pat_nonpond")),
                              subtitle = "Avec non-r\u00e9ponse, non redress\u00e9e",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            ),
                            infoBox(
                              title = "Patrimoine moyen",
                              value = textOutput(ns("pat_pond")),
                              subtitle = "Avec redressement",
                              icon = icon("home"),
                              #fill = TRUE,
                              color="light-blue",
                              width = NULL
                            )
                     )),
                   fluidRow(
                     
                     
                     column(width=12,
                            
                            wellPanel(
                              #tags$p("Tableau", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                              
                              #DTOutput(ns("tab1")),br(),
                              tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                              
                            )  )
                   )
            )
          )
  )
  
}
    
#' stat2_redress_impact Server Functions
#'
#' @noRd 
mod_stat2_redress_impact_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    global <- reactiveValues(dt_apur = grandile ,data= grandile)
    local <- reactiveValues(dt=NULL, var=NULL, dt_pond=NULL)
    
    observeEvent(input$go,{
      local$dt <- global$dt_apur
      
      #je prépare une nouvelle base grandile avec une non-réponse simulée
      mydt <- local$dt
      mydt$ECH <- 1 #comme si enquête exhaustive
      set.seed(12345)
      mydt$alea <- runif(5418)
      mydt <- mydt %>% mutate(
        REPONDANT = case_when(
          PCS %in% c(2,3) & alea <= 0.3 ~ 1, #taux de réponse de 30% chez cadres et artisans
          PCS %in% c(4) & alea <= 0.5 ~ 1, #50% de tx de réponse chez les prof intermédiaires
          PCS %in% c(1,5,6,7,8) & alea <= 0.9 ~ 1, #et 90% chez les autres
          TRUE ~ 0,
        ))
      mydt$REPONDANT_C <- as.character(mydt$REPONDANT)
      local$dt <- mydt
      
      local$var <- input$Varcontrole
      local$dt_pond <- pond_m2(data_pond = local$dt, var_pond = local$var)
      
    })
    
#   output$tab1 <- renderDT({
#      
#      validate(need(expr = !is.null(local$dt),
#                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
#     a <- local$dt_pond
#     mean_log_pond <- round(sum((a$SUPERF_LOG)*(a$PONDEF))/nrow(global$data))
#     mean_jardin_pond <- round(sum((a$SUPERF_JARDIN)*(a$PONDEF))/nrow(global$data))
#     surfaces_pond <- c(mean_log_pond,mean_jardin_pond)
#     
#     
#     mean_log_npond <- round(mean(a$SUPERF_LOG))
#     mean_jardin_npond <- round(mean(a$SUPERF_JARDIN))
#     surfaces_npond <- c(mean_log_npond,mean_jardin_npond)
#     a <- data.frame(surfaces_npond, surfaces_pond)
#     rownames(a)<- c( "Superficie des logements","Superficie des jardins")
#     a
#  })
   
   output$moy_poids <- renderText({
     req(local$dt)
      m <- local$dt_pond 
     round(mean(m$PONDEF),2)
   })
   
   output$sd_poids <- renderText({
     req(local$dt)
     m <- local$dt_pond 
     round(sd(m$PONDEF),2)
   })
   
   output$rev_nonpond <- renderText({
     req(local$dt)
     m <- local$dt_pond 
     paste0(format(round(mean(m$REV_DISPONIBLE)), big.mark = " "), " ", "€")
   })
   
   output$pat_nonpond <- renderText({
     req(local$dt)
     m <- local$dt_pond 
     paste0(format(round(mean(m$PATRIMOINE)), big.mark = " "), " ", "€")
   })
   
   output$rev_pond <- renderText({
     req(local$dt)
     m <- local$dt_pond 
     paste0(format(round(sum(m$REV_DISPONIBLE_POND)/nrow(global$data)), big.mark = " "), " ", "€")
   })
   
   output$pat_pond <- renderText({
     req(local$dt)
     m <- local$dt_pond 
     paste0(format(round(sum(m$PATRIMOINE_POND)/nrow(global$data)), big.mark = " "), " ", "€")
   })
   
   
   output$rev_mere <- renderText({
     req(local$dt)
     m <- global$data 
     paste0(format(round(mean(m$REV_DISPONIBLE)), big.mark = " "), " ", "€")
   })
   
   output$pat_mere <- renderText({
     req(local$dt)
     m <- global$data
     paste0(format(round(mean(m$PATRIMOINE)), big.mark = " "), " ", "€")
   })
  }
)}
    
## To be copied in the UI
# mod_stat2_redress_impact_ui("stat2_redress_impact")
    
## To be copied in the server
# mod_stat2_redress_impact_server("stat2_redress_impact")
