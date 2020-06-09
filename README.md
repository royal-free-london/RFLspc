***Early work, under development***

# RFLspc
Adaption of Royal Free Standard SPC Excel template for use in R.

To install:
```r
 # if not installed already, instal devtools with install.packages('devtools')
remotes::install_github('royal-free-london/RFLspc')
```

Ensure dependencies packages are installed. In particular, the RDCOMClient package (which evaluates the excel model) needs to be installed using the code below:
```r
install.packages("RDCOMClient", repos = "http://www.omegahat.org/R")
```


To use:

load the package...
```r
library('RFLspc')
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

