# Gauge Widget

An animated SVG gauge widget

## Usage

``` r
gauge(id, value = 0, options = NULL, wrap = TRUE)
```

## Arguments

- id:

  a character string to specify the unique id for the widget

- value:

  the progress value to display (should be between 0 and 100)

- options:

  an optional list of parameters to tune the widget

- wrap:

  whether or not the widget should be wrapped into a div container

## Value

an HTML widget

## Details

`id` is used to compute ids for children nodes of the svg widget, pretty
much like the namespace id in Shiny modules. To ensure uniqueness when
used in Shiny modules, the id of the module instance should be used as a
prefix `id = paste(id, "gauge", sep = "-)`.

The div container used when `wrap = TRUE` comes with basic style (width:
300px, height: 300px, margin: 20px) to avoid the widget to occupy the
whole page. If you wish to specify other values or options, set
`wrap = FALSE` and encapsulate the widget in your own div.

## Examples

``` r
if (FALSE) { # \dontrun{
gauge(id = "foo")
} # }
```
