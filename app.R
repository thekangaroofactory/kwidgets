
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

    # -- insert JS
    ktools::with_js(package = "kwidgets", src = "assets", script = "js/gauge.js")
    ktools::with_js(package = "kwidgets", src = "assets", script = "js/bar.js")

    new_value <- sample(x = 0:100, size = 1)
    new_arc_value <- 2*pi * 48 * (100 - new_value) / 100

    # color <- sample(x = c("grey", "beige", "cyan", "pink"), size = 1)

    session$sendCustomMessage("update", list(progress = new_arc_value, label = paste0(new_value, "%")))
    session$sendCustomMessage("update_bar", paste("M 0 50", new_value, "50"))

    output$progress <- renderText(paste0(new_value, "%"))

  })

}

# Run the application
shinyApp(ui = ui, server = server)
