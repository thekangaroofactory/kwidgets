
library(shiny)
library(bslib)

# Define UI
ui <- fluidPage(

  tags$head(
    # Listen for update messages
    tags$script("
      Shiny.addCustomMessageHandler('update', function(value) {
        const anim = document.getElementById('target');
        var old_value = anim.getAttribute('to');
        anim.setAttribute('from', old_value);
        anim.setAttribute('to', value);
        anim.beginElement()
      });
    "),

    # Listen for update_bar messages
    tags$script("
    Shiny.addCustomMessageHandler('update_bar', function(value) {
      const anim = document.getElementById('foo');
      var old_value = anim.getAttribute('to');
      anim.setAttribute('from', old_value);
      anim.setAttribute('to', value);
      anim.beginElement()
    });
    ")
    ),

  # const gauge = document.getElementById('progress');
  # gauge.setAttribute('stroke', value['color']);
  #

  # Application title
  titlePanel("{kwidgets} demo"),

  layout_columns(
    gauge(),
    perf()),

  actionButton(inputId = "click", label = "update value"),
  h1(textOutput("progress"))

)

# Define server
server <- function(input, output, session) {

  old_value <- reactiveVal(180)

  observeEvent(input$click, {

    new_value <- sample(x = 0:100, size = 1)
    new_arc_value <- 2*pi * 48 * (100 - new_value) / 100

    # color <- sample(x = c("grey", "beige", "cyan", "pink"), size = 1)

    session$sendCustomMessage("update", new_arc_value)
    session$sendCustomMessage("update_bar", paste("M 0 50", new_value, "50"))

    output$progress <- renderText(paste0(new_value, "%"))

  })

}

# Run the application
shinyApp(ui = ui, server = server)
