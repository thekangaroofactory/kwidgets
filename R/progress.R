
#' Progress Widget
#'
#' @param id a character string to specify the unique id for the widget
#' @param value the progress value to display (should be between 0 and 100)
#' @param options an optional list of parameters to tune the widget
#' @param wrap whether or not the widget should be wrapped into a div container
#'
#' @returns an HTML widget
#' @importFrom ktools with_js
#' @export
#'
#' @examples
#' \dontrun{
#' progress()
#' }

progress <- function(id, value = 0, options = NULL, wrap = TRUE){

  # -- check arguments
  if(!is.null(options))
    stopifnot("options must be a list" = is.list(options))

  # -- insert javascript dependency
  # for when it's called from server side
  ktools::with_js(package = "kwidgets",
                  src = "assets",
                  script = "js/progress.js")

  # -- init
  options <- list(width = 4,
                  color = "#000",
                  duration= "1.5s",
                  reference = 40)

  # -- define the widget
  widget <- htmltools::tags$svg(
    id = paste(id, "progress", sep = "-"),
    viewBox = "0 0 100 100",

    # -- reference line
    htmltools::tags$line(
      x1 = options$reference,
      x2 = options$reference,
      y1 = "45",
      y2 = "55",
      stroke = "grey",
      'stroke-width' = "0.5",
      'stroke-dasharray' = "4",
      opacity = "0.5"),

    # -- reference label
    htmltools::tags$text(
      x = options$reference,
      y = "60",
      'text-anchor' = "middle",
      'font-size' = "5px",
      "ref."),

    # -- progress
    htmltools::tags$g(
      fill = "none",
      'stroke-width' = options$width,
      'stroke-linecap' = "round",
      'stroke-linejoin' = "round",
      transform = "translate(5 5) scale(0.9 0.9)",

      # -- background
      htmltools::tags$path(
        stroke = "hsl(0, 0%, 0%)",
        opacity = "0.5",
        d = "M 0 50 100 50"),

      # -- foreground
      htmltools::tags$path(
        stroke = options$color,
        d = "M 0 50 0 50",

        # -- animation
        htmltools::tags$animate(
          id = paste(id, "progress-animate", sep = "-"),
          attributeName = "d",
          from = "M 0 50 0 50",
          to = "M 0 50 0 50",
          dur = options$duration,
          keySplines = "0.1 0.8 0.2 1;",
          calcMode = "spline",
          fill = "freeze"))))

  # -- return
  if(wrap)
    htmltools::div(style = "width: 300px;height: 300px;margin: 20px;", widget)
  else
    widget

}
