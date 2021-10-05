
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Multiserver

<!-- badges: start -->
<!-- badges: end -->

The goal of Multiserver is to display a table that shows a first come,
first serve queuing system.

## Installation

You can install the released version of Multiserver from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Multiserver")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Sean-Spence/Multiserver")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("Multiserver")
Multiserver(bank$arrival_time, bank$service_time, 1)
#> # A tibble: 100 x 4
#>    Arrivals ServiceBegins ChosenServer ServiceEnds
#>       <dbl>         <dbl>        <dbl>       <dbl>
#>  1     119.          119.            1        149.
#>  2     134.          134.            2        289.
#>  3     326.          326.            1        356.
#>  4     339.          339.            2        424.
#>  5     372.          372.            1        652.
#>  6     396.          424.            2        502.
#>  7     400.          502.            2        537.
#>  8     491.          537.            2        696.
#>  9     531.          652.            1        883.
#> 10     628.          696.            2        802.
#> # ... with 90 more rows
```
