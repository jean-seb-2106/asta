#' stat6_classif_donnees UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom skimr skim
mod_stat6_classif_donnees_ui <- function(id){
  ns <- NS(id)

    
    tabItem(
      tabName = "subitem__1",
      h2("Les données"),
      fluidRow(
        
        
        column(3,
                      
                      wellPanel(
                        
                        tags$p("Paramètres", 
                               style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                        
                        selectInput(inputId = ns("select1"),
                                    label = "Choississez une base de données",
                                    choices = c("vins","grandile")),
                        
                        actionButton(ns("go1"),label = "Affichez la base")
                        
                      ),
                      
                      
                      
                      
                      wellPanel(
                        
                        tags$p("Description de la base de données", 
                               style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                        
                        textOutput(ns("txt1"))
                        
                      )
                      
                      
                      
      ),
      
      column(9, 
             
             wellPanel(
               
               tags$p("Visualisation de la base", 
                      style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
               
               # DTOutput(ns("dt1"))
               verbatimTextOutput(ns("print1"))
               
             ) 
             
      )
      
      )
      
      
      
      
    )
    
    
 
  
}
    
#' stat6_classif_donnees Server Functions
#'
#' @noRd 
mod_stat6_classif_donnees_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    
    ns <- session$ns
    
    local <- reactiveValues(dt = NULL)
    
    #Quand je clique sur le bouton, la base de données remonte
    #au niveau global. Elle pourra ensuite être utilisée dans les autres 
    #modules
    observeEvent(input$go1,{
      local$dt <- eval(parse(text = input$select1))
      
      if (input$select1 == "vins"){
        local$dt <- local$dt %>% rename(target=quality)
        
      }else if(input$select1 == "grandile"){
        local$dt <- local$dt %>% 
          rename(target=PAUVRE) %>% 
          select(-starts_with("LIB")) %>% 
          select(-IDENT) %>% 
          mutate(target = as.factor(target))
        
      }
      global$dt <- local$dt
    })
  
    
    # output$dt1 <- renderDT({
    #   
    #   req(local$dt)
    #   # shinipsum::random_DT(nrow = 10,ncol = 10)
    #   DT::datatable(local$dt)
    #   # skim(local$dt)
    #   
    # })
    
    output$print1 <- renderPrint({
      
      req(local$dt)
      
      skim(local$dt)
      
    })
    
    output$txt1 <- renderText(
      
      shinipsum::random_text(nwords = 100)
    )
 
  })
}
    
## To be copied in the UI
# mod_stat6_classif_donnees_ui("stat6_classif_donnees")
    
## To be copied in the server
# mod_stat6_classif_donnees_server("stat6_classif_donnees")
