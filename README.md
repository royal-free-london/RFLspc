***Early work, under development***

# RFLspc
Adaption of Royal Free Standard SPC Excel template for use in R.

To install:
```r
 # if not installed already, install devtools with install.packages('devtools')
remotes::install_github('royal-free-london/RFLspc')
```

Ensure dependencies packages are installed. In particular, the RDCOMClient package (which evaluates the excel model) needs to be installed using the code below:
```r
install.packages("RDCOMClient", repos = "http://www.omegahat.org/R")
```
Chart styling is also done with the RFLtheme package, available to download and use here: https://github.com/royal-free-london/RFLtheme

To use:

load the package... (and the tidyverse package which at the moment appears not to being imported correctly on package load)
```r
library('RFLspc')
library('tidyverse')
```
...Generate data.frame or tibble with ONLY two variables, the first a date/datetime variable, and the second a numeric variable to plot.
An example of the data format is saved in the package as an example and can be accessed in the object.

```r
df_exampleData
```
Finally, use the main function, **ggRFLspc**:
```r
ggRFLspc(df_exampleData, title="Example SPC Chart", subtitle="Here is some example data")
```

