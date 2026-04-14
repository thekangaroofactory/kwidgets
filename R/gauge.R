
#' Gauge Widget
#'
#' @description
#' An animated SVG gauge widget
#'
#' @param id a character string to specify the unique id for the widget
#' @param wrap whether or not the widget should be wrapped into a div container
#' @param value the progress value to display (should be between 0 and 100)
#' @param options an optional list of parameters to tune the widget
#'
#' @details
#' `id` is used to compute ids for children nodes of the svg widget, pretty much
#' like the namespace id in Shiny modules.
#' To ensure uniqueness when used in Shiny modules, the id of the module instance
#' should be used as a prefix `id = paste(id, "gauge", sep = "-)`.
#'
#' The div container used when `wrap = TRUE` comes with basic style (width: 300px,
#' height: 300px, margin: 20px) to avoid the widget to occupy the whole page.
#' If you wish to specify other values or options, set `wrap = FALSE` and encapsulate
#' the widget in your own div.
#'
#' @returns an HTML widget
#' @importFrom ktools with_js
#' @export
#'
#' @examples
#' \dontrun{
#' gauge(id = "foo")
#' }

gauge <- function(id, value = 0, options = NULL, wrap = TRUE){

  # -- check arguments
  if(!is.null(options))
    stopifnot("options must be a list" = is.list(options))

  # -- insert javascript dependency
  # for when it's called from server side
  ktools::with_js(package = "kwidgets",
                  src = "assets",
                  script = "js/gauge.js")

  # -- defaults
  # Should be wrapped in some function that use can call to get the defaults
  # defaults("gauge")
  defaults <- list(color = "#000",
                   width = 4,
                   duration = "1.5s",
                   bg = TRUE,
                   bg_color = "#AAA",
                   bg_width = 1)

  # -- complete
  # Should be wrapped into a function (maybe ktools)
  options <- c(options, defaults[!names(defaults) %in% names(options)])

  # -- init
  radius <- 48
  cx <- 50
  cy <- 50

  # -- compute stroke length
  perimeter <- 2 * pi * radius
  progress <- perimeter * (100 - value) / 100

  # -- define the widget
  widget <- htmltools::tags$svg(id = id,
               viewBox = "0 0 100 100",

               # -- background circle
               if(options$bg)
                 htmltools::tags$circle(fill = "none",
                             stroke = options$bg_color,
                             'stroke-width' = options$bg_width,
                             cx = cx,
                             cy = cy,
                             r = radius,
                             'stroke-dasharray' = perimeter),

               # -- progress label
               htmltools::tags$text(id = paste(id, "label", sep = "-"),
                         x = cx,
                         y = cy,
                         'text-anchor' = "middle",
                         'dominant-baseline' = "middle",
                         class = "small",
                         paste0(value, "%")),

               # -- progress circle
               htmltools::tags$circle(id = paste(id, "progress", sep = "-"),
                           fill = "none",
                           stroke = options$color,
                           'stroke-width' = options$width,
                           cx = cx,
                           cy = cy,
                           r = radius,
                           'stroke-dasharray' = perimeter,
                           'stroke-linecap' = "round",
                           transform = "rotate(-90 ) translate(-100 0)",

                           # -- progress animation
                           htmltools::tags$animate(id = paste(id, "progress-animate", sep = "-"),
                                        attributeName = "stroke-dashoffset",
                                        from = perimeter,
                                        to = progress,
                                        dur = options$duration,
                                        keySplines = "0.1 0.8 0.2 1;",
                                        calcMode = "spline",
                                        fill = "freeze")))

  # -- return
  if(wrap)
    htmltools::div(style = "width: 300px;height: 300px;margin: 20px;", widget)
  else
    widget

}
