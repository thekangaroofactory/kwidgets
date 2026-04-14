# Update Gauge Widget

Check if the required dependency needs to be inserted on UI side and
update the gauge widget.

## Usage

``` r
gauge_update(id, value, session = shiny::getDefaultReactiveDomain())
```

## Arguments

- id:

  the widget to update

- value:

  the new progress value to display

- session:

  the session of object of the server function

## Examples

``` r
if (FALSE) { # \dontrun{
gauge_update(value = 52)
} # }
```
