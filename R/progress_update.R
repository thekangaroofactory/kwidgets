
#' Update Progress Widget
#'
#' @description
#' Check if the required dependency needs to be inserted on UI side
#' and update the progress widget.
#'
#' @param id the widget to update
#' @param value the new progress value to display
#' @param session the session of object of the server function
#'
#' @export
#'
#' @examples
#' \dontrun{
#' progress_update(value = 52)
#' }

progress_update <- function(id, value, session = shiny::getDefaultReactiveDomain()){

  # -- insert javascript dependency
  ktools::with_js(package = "kwidgets",
                  src = "assets",
                  script = "js/progress.js")

  # -- call update
  session$sendCustomMessage("update_progress",
                            list(id = id,
                                 progress = paste("M 0 50", value, "50")))

}
