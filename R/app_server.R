#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  
  
  mod_stat1_server("stat1_ui_1")
  
  mod_stat2_server("stat2_ui_1")
  
}
