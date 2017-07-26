# **unrepx** package for R: Analysis of unreplicated experiments

#### Developer/maintainer
Russ Lenth, University of Iowa, `russell-lenth@uiowa.edu`

The **unrepx** package provides much of what one needs to analyze basic unreplicated
screening experiments such as two-level factorial and fractional factorial designs,
in which one has a set of independent effect estimates but no degrees of freedom for
error. The analyses are based on underlying assumptions that the effect estimates are independent normal, all with with the same variance; and that effect sparsity holds whereby only a few of the effects are active.

The package provides basic functions `yates()` and `gyates()` for estimating effects; plotting functions `hnplot()` (half-normal plot), `refplot()` (reference plot), and `parplot()` (Pareto plot) for displaying effects and depicting which may be active; and statistical analysis functions `PSE()` (pseudo standard error), `ME()` (margin of error), `ref.dist()` (reference distribution), and `eff.test()` (tests of effects). The `dot.plot()` function that underlies `ref.plot()` is also usable in its own right for creating resizeable dot plots. There are also example effect estimates, and a function for creating half-normal graph paper.

To see an overview of these features, use `vignette("overview", package = "unrepx")`. You may also view it [here](https://github.com/rvlenth/unrepx/blob/master/vignettes/overview.Rmd), but without the graphs

## Installation
* To install latest version from CRAN (once it is available there), run 
```
install.packages("unrepx")
```

* To install the latest development version from Github, have the newest **devtools** package installed, then run
```
devtools::install_github("rvlenth/unrepx", dependencies = TRUE)
```
For latest release notes on this development version, see the [NEWS file](https://github.com/rvlenth/unrepx/blob/master/inst/NEWS)
