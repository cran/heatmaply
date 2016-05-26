heatmaply 0.2.1 (2016-05-23)
==============================

### BUG FIXES
* fix various import issues that caused warnings with devtools::


heatmaply 0.2.0 (2016-05-23)
==============================
### NEW FEATURES
* More control over colors in heatmaply via the new parameters: colours, limits, na.value, and scale_colour_gradient_fun.
* first attempts at row_dend_left (although this is not yet working.)

### BUG FIXES
* dendrograms are now presented without axes text.
* passing scale (= "row" or "column") works again.


heatmaply 0.1.0 (2016-05-14)
==============================

* First (very rough) version. It has a minimal working example, as well as MANY things to fix/tweak/adjust.




TODO:
==============================
* fix side labels
* add bars for extra categories
* remove hover information from dendrograms
* remove unneeded code from d3heatmap
* fix docs!
* add many options for controlling the heatmap "as it should be"
