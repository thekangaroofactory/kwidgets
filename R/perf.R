

perf <- function(){

  div(style = "width: 300px;height: 300px;margin: 20px;",

      tags$svg(id="progress",
               viewBox="0 0 100 100",

               tags$line(x1="40",
                         x2="40",
                         y1="45",
                         y2="55",
                         stroke = "grey",
                         'stroke-width' = "0.5",
                         'stroke-dasharray'="4",
                         opacity="0.5"),

               tags$text(x="40",
                         y="60",
                         'text-anchor'="middle",
                         'font-size'="5px",
                         "reference"),

               tags$g(fill="none",
                      'stroke-width'="4",
                      'stroke-linecap'="round",
                      'stroke-linejoin'="round",
                      transform="translate(5 5) scale(0.9 0.9)",

                      tags$path(stroke="hsl(0, 0%, 0%)",
                                opacity="0.5",
                                d="M 0 50 100 50"),

                      tags$path(stroke="black",
                                d="M 0 50 0 50",
                                tags$animate(
                                  id="foo",
                                  attributeName="d",
                                  from="M 0 50 0 50",
                                  to="M 0 50 75 50",
                                  dur="1.5s",
                                  keySplines="0.1 0.8 0.2 1;",
                                  keyTimes="0;1",
                                  calcMode="spline",
                                  fill="freeze")))))

}
