# Caring for your document {#doc-care}




<img src="images/illos/insert.jpg" style="display: block; margin: auto;" />

Once you have your published doc in place, it's likely that you will want to change it sooner or later. The key to updating is that you must 🧶 *Knit* each time before you push to GitHub--otherwise your changes won't be published. This sounds easy enough, but trust us, it is also easy enough to forget!

Here's what the change-my-doc workflow looks like for me:

1. **Open** the existing RStudio project
1. 🧶 *Knit* right away to see where things left off, or turn on `xaringan::inf_mr()` to see a live preview of your changes.
1. Make edits, preview changes, **rinse and repeat...**
1. **Commit and push** all changes to GitHub.

## Live editing

<div class="side-by-side">
<div class="side1">
Whenever you are editing a single R Markdown file, and outputting to HTML format, you can turn on "live reload" while you work. This means that, after turning it on, every time you *Save* your updated output re-renders in your RStudio viewer pane, and also in a browser window if you open it up.
</div>

<div class="side2">
<div class="figure" style="text-align: center">
<a href="https://yihui.name/en/2019/02/ultimate-inf-mr/" target="_blank"><img src="https://user-images.githubusercontent.com/163582/53144527-35f7a500-3562-11e9-862e-892d3fd7036d.gif" alt="Demo of R Markdown live reload from [Yihui Xie](https://yihui.name/en/2019/02/ultimate-inf-mr/)"  /></a>
<p class="caption">(\#fig:unnamed-chunk-3)Demo of R Markdown live reload from [Yihui Xie](https://yihui.name/en/2019/02/ultimate-inf-mr/)</p>
</div>
</div>
</div>

To turn on "live reload", you'll first need to install the [`xaringan` package](https://github.com/yihui/xaringan)^[`xaringan` is an R package for making presentation slides with R Markdown]:


```r
install.packages("xaringan")
```

Then close RStudio.

When you reopen RStudio, in your "Addins" dropdown, scroll down to the bottom where the `xaringan` addins are. You should see ["Infinite Moon Reader"](https://cran.r-project.org/web/packages/xaringan/xaringan.pdf). 

The same thing can be accomplished from your R console by running this code:


```r
xaringan::inf_mr()
```

Now, make a small change to your document, save, and watch the preview reload!

:::gotcha
You'll need to save this file first, before using the "Infinite Moon Reader".
:::

## Care for your code {#care-code}

### Use keyboard shortcuts

To insert R code chunks, you can use the ![](images/doc-insert-chunk.png){width=5%} button, or you could use keyboard shortcuts

    the keyboard shortcut Ctrl + Alt + I (OS X: Cmd + Option + I)

### Add a setup code chunk {#knitr-setup}

Get into the habit of always having your first `knitr` code chunk be a *setup* chunk using `knitr::opts_chunk$set()`. A good one looks like this:

````
```{r setup, include = FALSE}
knitr::opts_chunk$set(
  comment = "#>",
  fig.path = "figs" # use only for single Rmd files
  collapse = TRUE,
)
```
````

Inside the parentheses, list the chunk option on the left `=` a new default value on the right. Each chunk option is separated by a comma. The chunk option for the setup chunk itself is typically `include=FALSE` so that no one sees it but you.

A few notes on what the above chunk options do:

+ `comment = "#>"` sets the character on the far left of all printed output such that a reader could copy/paste a block of code into their console and run it (they won't be bombarded by errors produced if they accidentally include your printed output in their code)

+ `fig.path = "something-here-in-quotes"` ensures that all figures that you create with R code all get stored in the folder you name here; this helps if you need to pull up a figure file quickly without needing to explicitly export each individual figure. Read more [here](https://yihui.name/knitr/options/#plots).

+ `collapse = TRUE` fuses your code and output together for all code chunks throughout your document. 

    Below is a side-by-side changing this chunk option for an *individual* chunk. 

<div class="split">

<div class="split1">

<h3>Default chunk style</h3>



```r
library(tidyverse)
starwars %>% 
  count(homeworld, sort = TRUE)
```

```
## # A tibble: 49 x 2
##    homeworld     n
##    <chr>     <int>
##  1 Naboo        11
##  2 Tatooine     10
##  3 <NA>         10
##  4 Alderaan      3
##  5 Coruscant     3
##  6 Kamino        3
##  7 Corellia      2
##  8 Kashyyyk      2
##  9 Mirial        2
## 10 Ryloth        2
## # … with 39 more rows
```

</div>
<div class="split2">

<h3>Custom chunk style</h3>


```r
library(tidyverse)
starwars %>% 
  count(homeworld, sort = TRUE)
#> # A tibble: 49 x 2
#>    homeworld     n
#>    <chr>     <int>
#>  1 Naboo        11
#>  2 Tatooine     10
#>  3 <NA>         10
#>  4 Alderaan      3
#>  5 Coruscant     3
#>  6 Kamino        3
#>  7 Corellia      2
#>  8 Kashyyyk      2
#>  9 Mirial        2
#> 10 Ryloth        2
#> # … with 39 more rows
```

</div>
</div>

Our `setup` code chunk above affects *all* code chunks. It is called a global chunk option for that reason. You can (and should) use individual chunk options too, but setting up some nice ones that apply to all code chunks can save you time and can lessen your cognitive load as you create your content.

### Name your code chunks  {#knitr-name}

Remember how we [advised you set your `fig.path`?](#knitr-setup) One of the best things you can do for yourself is to *name your code chunks*. 

:::hat
h/t to [Maëlle Salmon](https://masalmon.eu/)

Maëlle wrote a [fun blog post](https://masalmon.eu/2017/08/08/chunkpets/) that (hopefully) will convince you that your chunks are pets rather than livestock (so they deserve a name!).
:::

In short, here are a few very good reasons to name your pets:

1. Easier to find them (use the chunk outline thingie in IDE)
1. Easier to debug when you 🧶 *Knit*
1. your figures get named!!


:::tip
We [recommend](https://yihui.name/en/2018/03/space-pain/) using dashes (`-`) in chunk labels instead of spaces or underscores (or really, any punctuation)...

<div class= "split">

<div class= "split1">
✔️ Good
````
```{r my-dog-skip}

```
````
</div>

<div class= "split2">
❌ Bad

````
```{r my_dog_skip}

```
````
</div>
</div>


:::


### Print pretty packages

If you load packages, we recommend setting that code chunk to be message = FALSE, warning = FALSE

````
```{r, message = FALSE, warning = FALSE}
library(tidyverse)
library(janitor)
```
````


## Care for your self {#self-care}

### Use portable file paths {#doc-here}

<div class="side-by-side">
<div class="side1">

When you are in an `.Rproj`, you'll probably want to create some directories like `data/`, `images/`, `figures/`, etc. We strongly encourage you to use the [here package](https://here.r-lib.org/) to build up safe file paths. Read more from Jenny Bryan's [*What They Forgot to Teach You About R* workshop](https://whattheyforgot.org/safe-paths.html).

If you are *still* skeptical, read Malcolm Barret's blog post [*Why should I use the here package when I'm already using projects?*](https://malco.io/2018/11/05/why-should-i-use-the-here-package/)

</div>
<div class="side2">

<div class="figure" style="text-align: center">
<a href="https://twitter.com/allison_horst?lang=en" target="_blank"><img src="images/horst_here.png" alt="Artwork by [Allison Horst](https://twitter.com/allison_horst?lang=en)" width="1386" /></a>
<p class="caption">(\#fig:horst-here)Artwork by [Allison Horst](https://twitter.com/allison_horst?lang=en)</p>
</div>

</div>
</div>


:::hat
> "The chance of the `setwd()` command having the desired effect – making the file paths work – for anyone besides its author is 0%."
>
> &mdash; [Jenny Bryan](https://www.tidyverse.org/articles/2017/12/workflow-vs-script/)
:::

### Name your files nicely

![https://twitter.com/DGuarch/status/663049353007931392?s=20](images/jb-fortune-cookie.jpg)

### Add notes to self

also include how to leave invisible notes to yourself `<!--- your comment --->`




# Design a how-to 

We define a "how-to" as a step-by-step recipe for a specific problem; light on narrative and teaching "why". R Markdown is a great tool for this kind of lesson, and we recommend (surprise!) HTML output with the following options.



## Share the source code {#rmd-code-download}

You can also make it easy for others to download the raw R Markdown file that produced the page on the your site that they're viewing. 

* **Add `code_download: true`** underneath `html_document:`. This particular YAML option is one that you might consider only applying to `.Rmd` files where it's relevant (in which case, you would include in the `.Rmd`'s YAML and not the `_site.yml`.)

<div class= side-by-side>
<div class = side1>

```yaml
---
name: YUM-101
output:
  html_document:
    toc: true
    toc_float: true
    code_download: true
---
```

</div>
<div class = side2>

![](images/rmd_custom/code_download.png)

</div>
</div>

## Show the data {#rmd-show-data}

DT


```r
library(DT)
datatable(iris)
```

<!--html_preserve--><div id="htmlwidget-bf98157a71df211937b9" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-bf98157a71df211937b9">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Share the data {#rmd-share-data}

For a how-to that involves some local data file that you need to share, it is nice to create an easy way for learners to download that data to a place on their computer.

1. `xfun::embed_file()` [link](https://yihui.name/en/2018/07/embed-file/)

1. DT buttons [link](https://rstudio.github.io/DT/003-tabletools-buttons.html)


```r
library(DT)
datatable(iris, 
  extensions = 'Buttons', options = list(
    dom = 'Bfrtip',
    buttons = 
      list('copy', 'print', list(
        extend = 'collection',
        buttons = c('csv', 'excel', 'pdf'),
        text = 'Download'
      ))
  )
)
```

<!--html_preserve--><div id="htmlwidget-4f32d739d80fae1c0ab2" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-4f32d739d80fae1c0ab2">{"x":{"filter":"none","extensions":["Buttons"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"Bfrtip","buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"text":"Download"}],"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Code Folding {#rmd-code-folding}

If you have a lot of code chunks, and you want to option for them to expand or fold with a click then:

* **Add `code_folding:`** as an option underneath `html_document:`. The options are either `show` or `hide`, depending on whether or not you want code chunks to be expanded by default.

<div class= side-by-side>

<div class = side1>


```r
output_dir: "docs"
output: 
  html_document:
    code_folding: show
```

</div>
<div class = side2>

![](images/rmd_custom/code_folding.png)

</div>
</div>





## Show code, hide results

The default global chunk option is `echo=TRUE`, which means that by default all code in code chunks is printed in the output. But sometimes you may want to suppress the output for pedagogical reasons on individual code chunks. You *could* set `eval = FALSE` as a global chunk option, but this would mean that all the code chunks will not get evaluated at all. Thus, you could have errors in your code that learners could stumble upon. Instead, we suggest setting `results='hide'` as a global chunk option to ensure that when you knit, you'll run into the same errors your learners will *before* they do.


````
```{r, results='hide'}
library(tidyverse)
glimpse(starwars)
```
````

## Show code, hide plots

If your code produces plots, though, `results='hide'` will not suppress the plot. To suppress printing a plot, you'll need to use `fig.show='hide'`.

````
```{r, results='hide', fig.show='hide'}
library(tidyverse)
glimpse(starwars)
ggplot(starwars, aes(x = height)) +
  geom_histogram(colour = "white", fill = "#3fb5bd") +
  theme_minimal()
```
````

## Show results, hide code

Sometimes you may want to shield your learners from all the code and just focus their attention on the output, whether it is printed or it produced a plot. This requires a single switch to `echo=FALSE` to "mute" the code from being output.

````
```{r, echo=FALSE}
library(tidyverse)
glimpse(starwars)
```
````

This is all the learner sees:


```
## Observations: 87
## Variables: 13
## $ name       <chr> "Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", "L…
## $ height     <int> 172, 167, 96, 202, 150, 178, 165, 97, 183, 182, 188, …
## $ mass       <dbl> 77.0, 75.0, 32.0, 136.0, 49.0, 120.0, 75.0, 32.0, 84.…
## $ hair_color <chr> "blond", NA, NA, "none", "brown", "brown, grey", "bro…
## $ skin_color <chr> "fair", "gold", "white, blue", "white", "light", "lig…
## $ eye_color  <chr> "blue", "yellow", "red", "yellow", "brown", "blue", "…
## $ birth_year <dbl> 19.0, 112.0, 33.0, 41.9, 19.0, 52.0, 47.0, NA, 24.0, …
## $ gender     <chr> "male", NA, NA, "male", "female", "male", "female", N…
## $ homeworld  <chr> "Tatooine", "Tatooine", "Naboo", "Tatooine", "Alderaa…
## $ species    <chr> "Human", "Droid", "Droid", "Human", "Human", "Human",…
## $ films      <list> [<"Revenge of the Sith", "Return of the Jedi", "The …
## $ vehicles   <list> [<"Snowspeeder", "Imperial Speeder Bike">, <>, <>, <…
## $ starships  <list> [<"X-wing", "Imperial shuttle">, <>, <>, "TIE Advanc…
```

## Interactively hide/show code

whole document

## Hide everything

Useful for you as you develop a lesson sometimes to save your code but hide the code and all output from learners. You can achieve the same thing with the combination of `echo=FALSE, results='hide', fig.show='hide'`. But the easier way is to use the `include` chunk option, which is by default set to TRUE.

````
```{r, include=FALSE}
library(tidyverse)
glimpse(starwars)
```
````



## Reuse your code

Once you embrace code chunk options, you may often find yourself copying and pasting code chunks so that you can use different options on the same code chunk. Like maybe you want the code to appear once, but you 

Special use case: plot first, code second

    Chunk 1: {r plot-first, echo = FALSE}
    Chunk 2: {r ref.label = 'plot-first', eval = FALSE}



## Two plots side-by-side


```r
ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) +
  geom_bar(position = position_dodge(preserve = "total"))

ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) +
  geom_bar(position = position_dodge2(preserve = "total"))
```

<img src="cookbook-doc_care_files/figure-html/dodge-st-1.png" width="50%" style="display: block; margin: auto;" /><img src="cookbook-doc_care_files/figure-html/dodge-st-2.png" width="50%" style="display: block; margin: auto;" />


## Include verbatim code chunks

You may have noticed that the code chunk output, even when `echo=TRUE`, does not show the actual code chunk options that you see in your .Rmd file. In order to print the full code chunk, you'll need to 

+ [verbatim code chunks](https://yihui.name/en/2017/11/knitr-verbatim-code-chunk/)

+ `knitr` [ref.label](https://yihui.name/knitr/demo/reference/) to reuse code chunks
+ the `fig.path` thing: https://yihui.name/knitr/options/#plots (see also: name your code chunks!)
+ making sure that your package warnings/messages don't print!
+ how to control numbers of digits that print 
+ control significance stars


```r
options(
  show.signif.stars = FALSE,     
  digits = 2
  )
```
