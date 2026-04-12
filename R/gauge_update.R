

#' Update Gauge Widget
#'
#' @description
#' Check if the required dependency needs to be inserted on UI side
#' and update the gauge widget.
#'
#' @param value the new progress value to display
#' @param session the session of object of the server function
#'
#' @export
#'
#' @examples
#' \dontrun{
#' gauge_update(value = 52)
#' }

gauge_update <- function(value, session = shiny::getDefaultReactiveDomain()){

  # -- insert javascript dependency
  ktools::with_js(package = "kwidgets",
                  src = "assets",
                  script = "js/gauge.js")

  # -- compute arc
  arc_value <- 2*pi * 48 * (100 - value) / 100

  # -- call update
  session$sendCustomMessage("gauge_update",
                            list(progress = arc_value,
                                 label = paste0(value, "%")))

}
