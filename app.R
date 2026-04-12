
library(shiny)
library(bslib)

# Define UI
ui <- fluidPage(

  # Application title
  titlePanel("{kwidgets} demo"),

  column(
    width = 3,
    gauge(id = "w1", options = list(color = "#710293"))),
  column(
    width = 3,
    progress(id = "w2")),

  actionButton(inputId = "click", label = "update value"),
  h1(textOutput("progress"))

)

# Define server
server <- function(input, output, session) {

  old_value <- reactiveVal(180)

  observeEvent(input$click, {

    # -- generate random value
    new_value <- sample(x = 0:100, size = 1)

    # -- update widgets
    gauge_update(new_value)
    progress_update(new_value)

    # -- display value
    output$progress <- renderText(paste0(new_value, "%"))

  })

}

# Run the application
shinyApp(ui = ui, server = server)
