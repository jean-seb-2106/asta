#' stat4_non_lineaire UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stat4_non_lineaire_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabItem(tabName = "reg_nl",
            h2("R\u00e9gression non lin\u00e9aire"),
            fluidRow(
              column(6,
                     
                     wellPanel(
                       tags$p("Regression puissance carr\u00e9e : y = a*x^2", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl1")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ),
                     wellPanel(
                       tags$p("Regression sinus : y = sinus(a*x)", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl2")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     )
              ),
              
              column(6,
                     wellPanel(
                       tags$p("Regression logarithme n\u00e9p\u00e9rien : y = a*ln(x) + b", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl3")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ),
                     wellPanel(
                       tags$p("Regression exponentielle : y = exp(x)", style = "font-size : 110%; font-weight : bold; text-decoration : underline;"),
                       
                       plotOutput(ns("regnl4")),br(),
                       tags$p("Source : CEFIL 2021", style = "font-size : 90%; font-style : italic; text-align : right;")
                       
                     ) 
              )
            )
    ))
  
}  
#' stat4_non_lineaire Server Functions
#'
#' @noRd 
mod_stat4_non_lineaire_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    local <- reactiveValues(dt = NULL, var = NULL)
    
    
    observeEvent(input$go, {
      local$dt <- global$data
      
    })
  
    
    output$regnl1 <- renderPlot({
      
      x <- seq(from = 0, to = 1000, by = 10)
      set.seed(15)
      y <- x^2+rnorm(n=101)*22000
      donnees_carre <-tibble(x,y)
      
      #fonction d'optimisation
      sce <- function(param, x, yobs){ytheo <- param[1]*x^2
      return( sum( (y-ytheo)^2) )}
      
      coeff_estime <- nlm ( f = sce , p = 1, x = x, yobs = y)$estimate
      
      
      ggplot(donnees_carre,aes(x=x,y=y)) + geom_point(size=2,color="blue3", alpha=0.4) +
        theme_bw()+
        geom_line(aes(x=x, y=coeff_estime*x^2), color="black", size=1.1) +
        labs(color="blue3",
             x = "axe x",
             y = "axe y"
        )
      # +geom_text(data = NULL, x = 855, y = 990000,  label="y = 0.999 * x^2")
    })
    
    output$regnl2 <- renderPlot({
      
      x <- seq(from = 0, to = 24, by = 0.25)
      set.seed(15)
      y <- sin(2*pi*x/24)+rnorm(n=97, mean=0, sd = 0.1)
      donnees_sinus <-tibble(x,y)
      
   
      
      
      #fonction d'optimisation
      sce <- function(param, x, yobs){ytheo <- param[1]*sin(2*pi*x/24)
      return( sum( (y-ytheo)^2) )}
      
      coeff_estime <- nlm ( f = sce , p = 1, x = x, yobs = y)$estimate
      
     
      ggplot(donnees_sinus,aes(x=x,y=y)) + geom_point(size=2,color="blue3", alpha=0.4) +
        theme_bw()+
        geom_line(aes(x=x, y=coeff_estime*sin(2*pi*x/24)), color="black", size=1.1)+
        # geom_line(aes(x=x, y=coeff_estime*sin(2*pi*x/24)+0.25), color="darkgrey", size=1.1)+
        labs(color="blue3",
             x = "axe x",
             y = "axe y"
        )
    })
    
    output$regnl3 <- renderPlot({
      
      x <- seq(from = 0, to = 500, by = 2)
      set.seed(15)
      y <- 8*log(x)-6+rnorm(251)*3
      donnees_ln <-tibble(x,y)
      
     
      #fonction d'optimisation
      sce <- function(param, x, yobs){ytheo <- param[1]*log(x)
      return( sum( (y-ytheo)^2) )}
      
      coeff_estime <- nlm ( f = sce , p = 1, x = x, yobs = y)$estimate
      
      
      ggplot(donnees_ln,aes(x=x,y=y)) + geom_point(size=2,color="blue3", alpha=0.4) +
        theme_bw()+
        geom_line(aes(x=x, y=7*log(x)), color="black", size=1.1)+
        labs(color="blue3",
             x = "axe x",
             y = "axe y"
        )
    })
    
    output$regnl4 <- renderPlot({
      
      x <- seq(from = 0, to = 10, by = 0.1)
      set.seed(15)
      y <- exp(x)+rnorm(n=101, mean=0, sd = 0.1)*10000
      donnees_exp <-tibble(x,y)
      
      
      #fonction d'optimisation
      sce <- function(param, x, yobs){ytheo <- param[1]*exp(x)
      return( sum( (y-ytheo)^2) )}
      
      coeff_estime <- nlm ( f = sce , p = 1, x = x, yobs = y)$estimate
      
      
      ggplot(donnees_exp,aes(x=x,y=y)) + geom_point(size=2,color="blue3", alpha=0.4) +
        theme_bw()+
        geom_line(aes(x=x, y=coeff_estime*exp(x)), color="black", size=1.1)+
        labs(color="blue3",
             x = "axe x",
             y = "axe y"
        )
    })
    
  })
}
    
## To be copied in the UI
# mod_stat4_non_lineaire_ui("stat4_non_lineaire_ui_1")
    
## To be copied in the server
# mod_stat4_non_lineaire_server("stat4_non_lineaire_ui_1")
