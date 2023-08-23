#' stat2_redress_na UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_redress_na_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemj",
          h2("Analyse de la non r\u00e9ponse"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez une variable \u00e0 \u00e9tudier",
                                 choices=c("Secteur d'activit\u00e9"="ACT", "PCS"="PCS", "Diplome"="DIPL")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats"))
                   ),
            
            column(8,
                   
                   fluidRow(
            column(6,
                   
                   
                   infoBox(
                     title = "Nb m\u00e9nages enquet\u00e9s",
                     value = textOutput(ns("nb_ech")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("buromobelexperte"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ) ,
                   infoBox(
                     title = "Taux de r\u00e9ponse",
                     value =textOutput(ns("taux_rep")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ) 
                   
            ),
            column(6,
                   
                   infoBox(
                     title = "Nb m\u00e9nages r\u00e9pondants",
                     value = textOutput(ns("nb_rep")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("registered"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   ),
                   infoBox(
                     title = "V de cramer avec la non-r\u00e9ponse",
                     value = textOutput(ns("vcramer")),
                     subtitle = "Source : Cefil 2021",
                     icon = icon("chart-line"),
                     #fill = TRUE,
                     color="light-blue",
                     width = NULL
                   )
            )),
            fluidRow(
            
            
            column(width=12,
                   
                  wellPanel(
                    tags$p("Tableau", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                    
                    tableOutput(ns("tab1")),br(),
                    tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                    
                  )  )
            )
  )
  )
  )
  
}
    
#' stat2_redress_na Server Functions
#'
#' @noRd 
mod_stat2_redress_na_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    global <- reactiveValues(dt_apur = grandile)
    
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
    
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
        local$var1 <- "REPONDANT_C"
    }) 
    
    
    
    output$nb_ech <- renderText({
      req(local$dt)
      local$nb_ech <- sum(local$dt[, "ECH"], na.rm = TRUE)
      
    })
    
    output$nb_rep <- renderText({
      req(local$dt)
      local$nb_rep <- sum(local$dt[, "REPONDANT"], na.rm = TRUE)
      
    })
    
    output$taux_sond <- renderText({
      req(local$dt)
      local$taux_sond <- paste0(round((sum(local$dt[, "ECH"], na.rm = TRUE)/ nrow(local$dt))*100,1), " %")
      
    })
    
    output$taux_rep <- renderText({
      req(local$dt)
      local$taux_rep <- paste0(round((sum(local$dt[, "REPONDANT"], na.rm = TRUE)/ sum(local$dt[, "ECH"], na.rm = TRUE))*100,1)," %")
      
    })
    
    
    output$vcramer <- renderText({
      req(local$dt, local$var)
      var1 <- local$dt[,local$var1]
      var2 <- local$dt[, local$var]
      t1 <- table(var1,var2)
      format(as.numeric(cramer.v(t1)), digits = 2)
    })
    
 
    output$tab1 <- renderTable({
      validate(
        need(expr = !is.null(local$dt),
             message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau")
      )
   
  
      t <- local$dt %>%   
        group_by(.data[[local$var]]) %>%
        summarise(echantillonnes =  sum(as.integer(ECH), na.rm = TRUE),
                  repondants = sum(as.integer(REPONDANT), na.rm = TRUE),
                  ) %>%
        mutate(taux_reponse = paste(round((
          repondants / echantillonnes
        ) * 100, 1), " %")) %>% 
        rename("R\u00e9pondants" = repondants , "Echantillonn\u00e9s" = echantillonnes )
      
      
      
    })
    
  })
}
    
## To be copied in the UI
# mod_stat2_redress_na_ui("stat2_redress_na")
    
## To be copied in the server
# mod_stat2_redress_na_server("stat2_redress_na")
