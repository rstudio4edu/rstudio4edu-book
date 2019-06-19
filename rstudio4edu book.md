--- 
title: "rstudio4edu Book"
author: 
- "Alison Hill" 
- "Desirée De Leon"
date: "2019-06-18"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
cover-image: images/books.jpg
description: "This is bookdown book to organize rstudio4edu materials."
github-repo: rstudio4edu/book
---

# Prerequisites {-}



To compile this example to PDF, you need XeLaTeX. You are recommended to install TinyTeX (which includes XeLaTeX): <https://yihui.name/tinytex/>.



^ Is this code chunk important?

<!--chapter:end:index.Rmd-->

# Learner Personas

Here are the learner personas we are keeping in mind.

<!--chapter:end:02-learner_personas.Rmd-->

# Introduction {#intro}

You can label chapter and section titles using `{#label}` after them, e.g., we can reference Chapter \@ref(intro). If you do not manually label them, there will be automatic labels anyway, e.g., Chapter \@ref(methods).

Figures and tables with captions will be placed in `figure` and `table` environments, respectively.


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```

<div class="figure" style="text-align: center">
<img src="01-intro_files/figure-html/nice-fig-1.png" alt="Here is a nice figure!" width="80%" />
<p class="caption">(\#fig:nice-fig)Here is a nice figure!</p>
</div>

Reference a figure by its code chunk label with the `fig:` prefix, e.g., see Figure \@ref(fig:nice-fig). Similarly, you can reference tables generated from `knitr::kable()`, e.g., see Table \@ref(tab:nice-tab).


```r
knitr::kable(
  head(iris, 20), caption = 'Here is a nice table!',
  booktabs = TRUE
)
```



Table: (\#tab:nice-tab)Here is a nice table!

 Sepal.Length   Sepal.Width   Petal.Length   Petal.Width  Species 
-------------  ------------  -------------  ------------  --------
          5.1           3.5            1.4           0.2  setosa  
          4.9           3.0            1.4           0.2  setosa  
          4.7           3.2            1.3           0.2  setosa  
          4.6           3.1            1.5           0.2  setosa  
          5.0           3.6            1.4           0.2  setosa  
          5.4           3.9            1.7           0.4  setosa  
          4.6           3.4            1.4           0.3  setosa  
          5.0           3.4            1.5           0.2  setosa  
          4.4           2.9            1.4           0.2  setosa  
          4.9           3.1            1.5           0.1  setosa  
          5.4           3.7            1.5           0.2  setosa  
          4.8           3.4            1.6           0.2  setosa  
          4.8           3.0            1.4           0.1  setosa  
          4.3           3.0            1.1           0.1  setosa  
          5.8           4.0            1.2           0.2  setosa  
          5.7           4.4            1.5           0.4  setosa  
          5.4           3.9            1.3           0.4  setosa  
          5.1           3.5            1.4           0.3  setosa  
          5.7           3.8            1.7           0.3  setosa  
          5.1           3.8            1.5           0.3  setosa  

You can write citations, too. For example, we are using the **bookdown** package [@R-bookdown] in this sample book, which was built on top of R Markdown and **knitr** [@xie2015].

<!--chapter:end:01-intro.Rmd-->

# General Questions

* What is the main takeaway from the <meta> tags (slide 25) in bookdown?

<!--chapter:end:03-questions.Rmd-->

# Outline of Deliverables

## How to make packages
  * [Demo package](https://github.com/rstudio4edu/testpackage)
  * Companion tutorial [site](https://rstudio4edu.github.io/firstclasspackage/) and [repo](https://github.com/rstudio4edu/firstclasspackage)
   
## How to make an R Markdown site / Distill
  * Bare bones demo site - workshop
  * Blinged out demo site - workshop
  * Companion tutorial site - workshop
    + Divided into two parts, for bare bones with add-on for "blinged out" version?
    
    
  * Bare bones demo site - course
  * Blinged out demo site - course
  * Compantion tutorial site - course
  
## Deliverable 

## Deliverable
  



<!--chapter:end:04-outline.Rmd-->

# Timeline

Here we can put weekly goals to make sure we are staying on target. 

Complete by the end of:

Week 12 (Aug 23):

Week 11 (Aug 16):

Week 10 (Aug 9):

Week 9 (Aug 2):

Week 8 (July 26):

Week 7 (July 19):

Week 6 (July 12):

Week 5 (July 5):

Week 4 (June 28):

Week 3 (June 21):


<!--chapter:end:05-timeline.Rmd-->


# References {-}


<!--chapter:end:06-references.Rmd-->

