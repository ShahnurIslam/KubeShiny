#' main_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_main_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      h2("A Random DT"),
      DT::DTOutput(ns("data_table")),
      h2("A Random Plot"),
      plotOutput(ns("plot")),
      h2("A Random Text"),
      tableOutput(ns("text"))
    )
 
  )
}
    
#' main_module Server Function
#'
#' @noRd 
mod_main_module_server <- function(input, output, session){
  ns <- session$ns
  output$data_table <- DT::renderDT({
    shinipsum::random_DT(5, 5)
  })
  output$plot <- renderPlot({
    shinipsum::random_ggplot()
  })
  output$text <- renderText({
    shinipsum::random_text(nwords = 50)
  })
}
    
## To be copied in the UI
# mod_main_module_ui("main_module_ui_1")
    
## To be copied in the server
# callModule(mod_main_module_server, "main_module_ui_1")
 
