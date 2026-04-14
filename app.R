
library(shiny)
library(bslib)

# Define UI
ui <- page_fluid(

  # Application title
  title ="{kwidgets} demo",

  layout_column_wrap(
    gauge(id = "w1", options = list(color = "#710293")),
    gauge(id = "w3", options = list(color = "#214999")),
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
    gauge_update(id = "w1", new_value)
    gauge_update(id = "w3", new_value / 2)
    progress_update(new_value)

    # -- display value
    output$progress <- renderText(paste0(new_value, "%"))

  })

}

# Run the application
shinyApp(ui = ui, server = server)
