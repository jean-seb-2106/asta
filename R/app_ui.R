#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import dashboardthemes
#' @import shinythemes
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {

    # Leave this function for adding external resources
    golem_add_external_resources()
    # Your application UI logic 
 
 
  
   navbarPage(
      
      shinyDashboardThemes(theme = "grey_light"),
      tags$script(HTML("var header = $('.navbar > .container-fluid');
header.append('<div style=\"float:right\"><ahref=\"URL\"><img src=\"logo_cefil.jpg\" alt=\"alt\" style=\"float:right;width:33px;height:41px;padding-top:10px;\"> </a>`</div>');
    console.log(header)")
      ),
      title = "ASTA", 
      
      #TabPanel Sommaire
      mod_sommaire_ui("sommaire_ui"),
      
      #TabPanel Stat1
      mod_stat1_ui("stat1_ui_1"),
      
      #TabPanel Stat2
      mod_stat2_ui("stat2_ui_1"),
      
      #TabPanel Stat3
      mod_stat3_ui("stat3_ui"),
      
      #TabPanel Stat4
      mod_stat4_ui("stat4_ui"),
      
      #TabPanel Stat5
      mod_stat5_ui("stat5_ui"),
      
      #TabPanel Stat6
      mod_stat6_ui("stat6_ui")
      
    )
  
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'asta'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

