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
#  install.packages('heatmaply')

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
# The default of heatmaply:
heatmaply(mtcars[1:10,], seriate = "OLO") %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
# Similar to OLO but less optimal (since it is a heuristic)
heatmaply(mtcars[1:10,], seriate = "GW") %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
# the default by gplots::heatmaply.2
heatmaply(mtcars[1:10,], seriate = "mean") %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
# the default output from hclust
heatmaply(mtcars[1:10,], seriate = "none") %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
# divergent_viridis_magma <- c(rev(viridis(100, begin = 0.3)), magma(100, begin = 0.3))
# rwb <- colorRampPalette(colors = c("darkred", "white", "darkgreen"))
library(RColorBrewer)
# display.brewer.pal(11, "BrBG")
BrBG <- colorRampPalette(brewer.pal(11, "BrBG"))
Spectral <- colorRampPalette(brewer.pal(11, "Spectral"))

heatmaply(cor(mtcars), 
          k_col = 2, k_row = 2,
          colors = BrBG(256),
          limits = c(-1,1)) %>% 
  layout(margin = list(l = 40, b = 40))


## ------------------------------------------------------------------------
heatmaply(mtcars, colors = heat.colors(100))

## ------------------------------------------------------------------------
heatmaply(mtcars, 
          scale_fill_gradient_fun = ggplot2::scale_fill_gradient2(low = "blue", high = "red", midpoint = 200, limits = c(0, 500)))


## ------------------------------------------------------------------------

library(heatmaply)
class_to <- function(x, new_class) {
  class(x) <- new_class
  x
}
na_mat <- function(x) {
  x %>% is.na %>% class_to("numeric") 
}


airquality %>% na_mat %>% 
  heatmaply(color = c("white","black"), grid_color = "grey",
            k_col =3, k_row = 3) %>% 
  layout(margin = list(l = 40, b = 50))



## ---- cache=FALSE--------------------------------------------------------
sessionInfo()

