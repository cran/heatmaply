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
heatmaply(mtcars, margins = c(40, 130))
# heatmaply(mtcars) %>% layout(margin = list(l = 130, b = 40))

## ------------------------------------------------------------------------
heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          limits = c(-1,1))

## ------------------------------------------------------------------------
# The default of heatmaply:
heatmaply(mtcars[1:10,], margins = c(40, 130),
          seriate = "OLO")

## ------------------------------------------------------------------------
# Similar to OLO but less optimal (since it is a heuristic)
heatmaply(mtcars[1:10,], margin = c(40, 130),
          seriate = "GW")

## ------------------------------------------------------------------------
# the default by gplots::heatmaply.2
heatmaply(mtcars[1:10,], margins = c(40, 130),
          seriate = "mean")

## ------------------------------------------------------------------------
# the default output from hclust
heatmaply(mtcars[1:10,],  margins = c(40, 130),
          seriate = "none")

## ------------------------------------------------------------------------
# divergent_viridis_magma <- c(rev(viridis(100, begin = 0.3)), magma(100, begin = 0.3))
# rwb <- colorRampPalette(colors = c("darkred", "white", "darkgreen"))
library(RColorBrewer)
# display.brewer.pal(11, "BrBG")
BrBG <- colorRampPalette(brewer.pal(11, "BrBG"))
Spectral <- colorRampPalette(brewer.pal(11, "Spectral"))

heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          colors = BrBG(256),
          limits = c(-1,1))


## ------------------------------------------------------------------------
heatmaply(mtcars, margins = c(40, 130),
          colors = heat.colors(100))

## ------------------------------------------------------------------------
heatmaply(mtcars, margins = c(40, 130),
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

# warning - using grid_color cannot handle a large matrix!
airquality[1:10,] %>% na_mat %>% 
  heatmaply(color = c("white","black"), grid_color = "grey",
            k_col =3, k_row = 3,
            margins = c(40, 50)) 



## ------------------------------------------------------------------------
x  <- as.matrix(datasets::mtcars)
gplots::heatmap.2(x, trace = "none", col = viridis(100), key = FALSE)

## ------------------------------------------------------------------------
heatmaply::heatmaply(x, seriate = "mean")

## ------------------------------------------------------------------------
# Example for using RowSideColors

x  <- as.matrix(datasets::mtcars)
rc <- colorspace::rainbow_hcl(nrow(x))

library(gplots)
library(viridis)
heatmap.2(x, trace = "none", col = viridis(100),
          RowSideColors=rc, key = FALSE)


## ------------------------------------------------------------------------
heatmaply(x, seriate = "mean",
          RowSideColors=rc)

## ------------------------------------------------------------------------
heatmaply(x[,-c(8,9)], seriate = "mean",
          col_side_colors = c(rep(0,5), rep(1,4)),
          row_side_colors = x[,8:9])


## ---- cache=FALSE--------------------------------------------------------
sessionInfo()

