***This package has broadly been replaced by SPCcharter here: https://github.com/johnmackintosh/spccharter and therefort unlikley to be developed/maintained in the future***




# RFLspc
====================
Adaption of Royal Free Standard SPC Excel template for use in R.

This package *actually* copies the data into the excel model; open, updates and saves the excel; and then returns a ggplot object. That’s inefficient and clunky, it's not how you would want to do it. **But** it does mean that the logic used is exactly the same as in our excel template which is a big deal for us.

## To install:
First, ensure all dependencies packages are installed. In particular, the RDCOMClient package (which evaluates the excel model) needs to be installed using the code below:
```r
devtools::install_github('omegahat/RDCOMClient')
```
Then, install package from this repository
```r
 # if not installed already, install devtools with install.packages('devtools')
remotes::install_github('royal-free-london/RFLspc')
```

Chart styling is also done with the RFLtheme package, available to download and use here: https://github.com/royal-free-london/RFLtheme

## To use:

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

