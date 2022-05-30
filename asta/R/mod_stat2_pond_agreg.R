#' stat2_pond_agreg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat2_pond_agreg_ui <- function(id){
  ns <- NS(id)
  
  tabItem(tabName = "subitemi",
          h2("Contr\u00f4les agr\u00e9g\u00e9s"),
          fluidRow(
            column(4,
                   
                   wellPanel(
                     tags$p("Param\u00e8tres", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                     selectInput(ns("Varfiltre"), 
                                 "Choisissez un filtre",
                                 choices = c("appartement","maison")),
                     
                     selectInput(ns("Varcontrole"), 
                                 "Choisissez la variable \u00e0 contr\u00f4ler",
                                 choices = c("Superficie du logement"="SUPERF_LOG", "Superficie du jardin"="SUPERF_JARDIN")),
                     
                     actionButton(inputId=ns("go"),"Mettre \u00e0 jour les r\u00e9sultats")),
                   
                   wellPanel(span("Le contr\u00f4le agr\u00e9g\u00e9  :", style="color:blue"), 
                             " il se fait sur un agr\u00e9gat, c'est-\u00e0-dire une variable construite \u00e0 partir des r\u00e9ponses de plusieurs unit\u00e9s enqut\u00e9es. Il vise \u00e0 rep\u00e9rer les valeurs aberrantes ou atypiques d'une unit\u00e9 par rapport aux autres.")
                             ),
        
          column(8,
                 wellPanel(
                 tags$p("Tableau statistique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                 tableOutput(ns("tab1")),br(),
                 tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")),
                 wellPanel(
                   tags$p("Graphique", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                   
                       plotOutput(ns("nuageapur")),br(),
                   tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                   
                 )
                   
              
          )
  )
  )
  
}
    
#' stat2_pond_agreg Server Functions
#'
#' @noRd 
mod_stat2_pond_agreg_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    global <- reactiveValues(dt_apur = grandile_apur)
    
    local <- reactiveValues(dt = NULL)
    
    
    observeEvent(input$go, {
      
      
      local$filtre <- input$Varfiltre
      local$Varcontrole <- input$Varcontrole
      local$dt <- global$dt_apur
    }) 
    
    output$tab1 <- renderTable({
      
      validate(need(expr = !is.null(local$dt),
                    message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le tableau"))
     
      t <- local$dt %>% filter(TYPE_LOG == local$filtre ) %>% 
        mutate(NBPIECES == as.character(NBPIECES)) %>% 
        group_by(NBPIECES) %>% 
        summarise(Effectifs = n(),Moyenne = mean(.data[[local$Varcontrole]]),Mediane=median(.data[[local$Varcontrole]]), Q1=quantile(.data[[local$Varcontrole]],probs = 0.25), Q3=quantile(.data[[local$Varcontrole]],probs = 0.75))
            })
    
    output$nuageapur <- renderPlot(
      {
        validate(
          need(expr = !is.null(local$dt),
               message = "Choisissez une variable dans le menu d\u00e9roulant et cliquez pour afficher le graphique")
        )
        
        grandile_apur2 <- local$dt %>% filter(SUPERF_JARDIN>0)
        p <- ggplot(grandile_apur2, aes(.data[[local$Varcontrole]], fill = TYPE_LOG)) +
          geom_histogram(binwidth = 20, colour="black") +
          ylab("Effectifs") + 
          geom_vline(aes(xintercept = mean(.data[[local$Varcontrole]]),color="Moyenne"), size=2 )+
          geom_vline(aes(xintercept = median(.data[[local$Varcontrole]]),color="Mediane"), size=2) +
          scale_colour_manual(name="Legende", values=c("Moyenne"="red", "Mediane"="blue"))
        
        p + scale_fill_brewer(palette='Blues')
        
      }
      
    )
    
    
  })
}
    
## To be copied in the UI
# mod_stat2_pond_agreg_ui("stat2_pond_agreg")
    
## To be copied in the server
# mod_stat2_pond_agreg_server("stat2_pond_agreg")
