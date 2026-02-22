

#' Gauge Widget
#'
#' @returns an HTML widget
#' @export
#'
#' @examples gauge()

gauge <- function(){

  div(style = "width: 300px;height: 300px;margin: 20px;",

      tags$svg(id="dummy",
               viewBox="0 0 100 100",

               tags$circle(fill="none",
                           stroke="#aaa",
                           'stroke-width'="1",
                           'stroke-mitterlimit'="0",
                           cx="50",
                           cy="50",
                           r="48",
                           'stroke-dasharray'="310"),

               tags$circle(id = "progress",
                           fill="none",
                           stroke="#000",
                           'stroke-width'="4",
                           'stroke-mitterlimit'="0",
                           cx="50",
                           cy="50",
                           r="48",
                           'stroke-dasharray'="301.5929",
                           'stroke-linecap'="round",
                           transform="rotate(-90 ) translate(-100 0)",

                           tags$animate(id="target",
                                        attributeName="stroke-dashoffset",
                                        from="301.5929",
                                        to="75",
                                        dur="1.5s",
                                        keySplines="0.1 0.8 0.2 1;",
                                        keyTimes="0;1",
                                        calcMode="spline",
                                        repeatCount="1",
                                        fill="freeze"))))

}
