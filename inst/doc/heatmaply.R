## ---- echo = FALSE, message = FALSE--------------------------------------
library(heatmaply)
library(knitr)
knitr::opts_chunk$set(
   # cache = TRUE,
   dpi = 60,
  comment = "#>",
  tidy = FALSE)

# http://stackoverflow.com/questions/24091735/why-pandoc-does-not-retrieve-the-image-file
# < ! -- rmarkdown v1 -->


## ---- eval = FALSE-------------------------------------------------------
#  # You'll need devtools
#  install.packages.2 <- function (pkg) if (!require(pkg)) install.packages(pkg);
#  install.packages.2('devtools')
#  # make sure you have Rtools installed first! if not, then run:
#  #install.packages('installr'); install.Rtools()
#  
#  devtools::install_github("ropensci/plotly")
#  devtools::install_github('talgalili/heatmaply')
#  

## ------------------------------------------------------------------------
library("heatmaply")

## ------------------------------------------------------------------------
library(heatmaply)
heatmaply(mtcars)

## ------------------------------------------------------------------------
heatmaply(mtcars) %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
heatmaply(cor(mtcars), 
          k_col = 2, k_row = 2,
          limits = c(-1,1)) %>% 
  layout(margin = list(l = 40, b = 40))

## ------------------------------------------------------------------------
heatmaply(mtcars, colors = heat.colors(100))

## ------------------------------------------------------------------------
heatmaply(mtcars, 
          scale_fill_gradient_fun = ggplot2::scale_fill_gradient2(low = "blue", high = "red", midpoint = 200, limits = c(0, 500)))


## ---- cache=FALSE--------------------------------------------------------
sessionInfo()

