# Trouble-shooting {#doc-trouble}




<img src="images/illos/insert.jpg" width="65%" style="display: block; margin: auto;" />

Analogy: trying to pin the tail on the donkey, or hit a pinata blindfolded


[Mine's troubleshooting tips:](https://mine-cetinkaya-rundel.github.io/teach-data-sci-icots2018/01-03-rmarkdown/01-03-rmarkdown.html#30)



+ Make sure RStudio and the rmarkdown package (and its dependencies) are up-to-date.

+ Set a global option for error = TRUE (or for a given chunk) so that your document renders even when there are errors.

+ Don’t try to change working directory within an R Markdown document. (If you do still decide to use setwd in a code chunk, beware that the new working directory will only apply to that specific code chunk, and any following code chunks will revert back to use the original working directory.)

Also see: 

+ https://rmd4sci.njtierney.com/common-problems-with-rmarkdown-and-some-solutions.html
+ https://happygitwithr.com/rmd-test-drive.html#rmd-troubleshooting
+ switch latex engines (do a screenshot here)
+ consider printing out your `sessionInfo()` [for pro-level, use DT]


```r
DT::datatable(devtools::session_info()$packages)
```
