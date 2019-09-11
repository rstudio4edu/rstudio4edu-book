# Organization



## Introduction {-#intro-org}


Can just deploy single Rmds to website via GitHub pages- easiest

Can use same strategy for rendering multiple files. 

But you probably want a way to bundle up your collection...

You need a project to house your collections of multiple Rmd documents




## For Courses

**Strongly Recommend**

* **Syllabus**: A place to provide the overview of your course, its goals, its policies (e.g. grading), and general logistics.
* **Schedule**: What is being taught when. You can also link relevant materials to this schedule (e.g. slides or readings for the day).
* **Licensing info**: Your materials can be discovered by anyone. Have a statement or badge somewhere on your site that lets people know how they can cite, use, or remix your work. Learn more about this in our Licensing section of this book.

**Nice to have**

* **Assignments, Materials, Labs, Readings **: Create a page (or pages) dedicated to housing more detailed descriptions of specific course content. The number of individual pages you'll want to create for this will likely depend a lot of which tool you use for your course site.
* **Chat**: Consider linking to a slack channel or a gitter account that can serve as a forum. 
* **Grades dashboard**: See an example of what this looks like [here](INSERT EXAMPLE).
* **Links to resources**: The class text, Rstudio cloud, etc. 
* **Link to GitHub repo**: Make it easy for your learners to find course source materials.
* **README.md**: Not sure what to put in your README? See [this](https://github.com/noffle/art-of-readme). 
* **Code of Conduct**: 


Here are some good example of course sites that you might pull some inspiration from:

* [Carl Boettiger](https://www.carlboettiger.info/teaching)'s course sites
* [Andrew Heiss](https://www.andrewheiss.com/teaching/)'s course sites
* [Mine Çetinkaya-Rundel](http://www2.stat.duke.edu/courses/Spring18/Sta199/)'s STA-199 course site

## For Workshops

For a workshop, it's better to keep the site organization simpler than a course's. Your learners probably won't be interacting with a workshop site long term, so no need to have complex menu or tab structures (with a short period of time, this can potentially make certain content feel "hidden" and users will be less likely to make use of it). 

**Strongly Recommend**

* **General Information**: "Where", "When", requirements (i.e. “bring a laptop, install this software”), and accesibility info. 
* **Abstract**: Summarize your workshop content. 
* **Learning Objectives**: Specifically, what should learners be able to do once they've completed your workshop?
* **Schedule**: Topics and timetables. When are the breaks?
* **Link to GitHub repo**: Make it easy for your learners to find workshop source materials.
* **README.md**: Not sure what to put in your README? See [this](https://github.com/noffle/art-of-readme). 
* **Licensing info**: Your materials can be discovered by anyone. Have a statement or badge somewhere on your site that lets people know how they can cite, use, or remix your work. Learn more about this in our Licensing section of this book.

**Nice to have**
* **Registration Info**: How can people sign up?
* **Access to Lesson Materials**: via link, download, or package.
* **Pre-Work/ Setup info**: what packages to install.
* **Chat**: Using something like gitter.
* **Code of Conduct**: Set the ground rules for everyone and also think about what your plan is should things go South. 
* **[Having the schedule times determined by a script](https://github.com/rstudio-education/deep-teaching/blob/master/course-planning/outline.Rmd)**: ::my eyes fill with hearts::

Here are some examples of workshop sites to give you a bit of inspiration:

* [Software Carpentry Template](http://carpentries.github.io/workshop-template/)
* [anglea-li/sotmus-r](https://github.com/angela-li/sotmus-r): Simple, clean layout for workshop info. It's only a README.md!
* [https://mine-cetinkaya-rundel.github.io/teach-data-science/](https://mine-cetinkaya-rundel.github.io/teach-data-science/)
* [https://github.com/carpentries/workshop-template](https://mine-cetinkaya-rundel.github.io/teach-data-science/)
* [https://jennybc.github.io/wtf-2019-rsc/](https://mine-cetinkaya-rundel.github.io/teach-data-science/)
* [https://github.com/rstudio-education/deep-teaching/blob/master/course-planning/outline.Rmd](https://mine-cetinkaya-rundel.github.io/teach-data-science/)

## For Online Tutorials

Online tutorials come in many shapes and sizes, so there's no one core element that we think every online tutorial should have. But since all online tutorials will lack the opportunity for face-to-face interaction with your learners, there are a couple things that you can include to make your site feel more personable and engaging:

**Content**

* **About page:** make sure your site has a place where you can clearly introduce yourself, your tutorial goals, and build credibility.

* **Licensing info**: Your materials can be discovered by anyone. Have a statement or badge somewhere on your site that lets people know how they can cite, use, or remix your work. Learn more about this in our Licensing section of this book.

**Interaction**

* **[Plotly](https://plot.ly/r/)**: Teaching concepts that involve plotting? Try using plotly to make your ggplots interactive. 

* **[iframe](https://www.quackit.com/html_5/tags/html_iframe_tag.cfm) tags**: `<iframe>` tags allow you to create an embedded window of a website inside of your own website.


## Types of R Markdown collections

(why, how, pros and cons of each)

   - **Distill**: Pros: looks clean and classy by default. Cons: Certain features that would otherwise be in an RMarkdown site that are useful for teaching are not available (e.g. `code_download`, `code_folding`). But built-in ways to presenting technical content (equations, references, and cross-referencing less effortful).
   - **R Markdown sites**: If you're new to the R Markdown world (and you want more than a single page or README), then starting with an R Markdown site is the most straightforward. For beginners, R Markdown sites have a simple organization that will be the least overwhelming to navigate: there are not that many pieces you need to put together to create a basic site. There's some customization options built-in, which is nice--and if that's not enough, then you can most likely still make your vision a reality by adding some HTML and CSS. There are also a ton online resources for R Markdown sites in case you get stuck. 
   
   - **bookdown**: Pros: A super long table of contents won't look unwieldy here. Cons: A bookdown book will always kind of look like a bookdown book.
   
   - **blogdown**: Pros: Using a theme can make your site look very structurally different from the other R Markdown collection sites. Many different themes (but we recommend sticking to the Academic theme)
   
## Choose your collections wisely

pros/cons of each of above, specifically from educational standpoint.

- **Distill**: Pros: You could use Distill to build your own site as an educator, but perhaps the biggest pro to familiarizing yourself with Distill sites (or site templates) is so that you can have your students create Distill documents of their own for turning in assignments, reports, etc. with technical content. For example, students will be able to produce reports with compiled references and annotations using all built-in options (no CSS or HTML needed!). Also, project directory structure can get pretty messy-- Distill has the same problem as R Markdown sites (see R Markdown).

- **R Markdown**: This is probably best for Workshops, but not courses. With a workshop, you won't need too many tabs or pages, so your directory structure won't be unruly, and you'll be able to get a Workshop site up and running without having to do much setup. But once you're interested in making a course site, you're probably going to want to make a lot more .Rmd pages (e.g. maybe you want every project or assignment to have its own page--all these pages will add up!). There's no good way to organize many pages in subdirectories *and* have them be knit to the docs folder with GitHub pages. It gets messy fast to have all these loose .Rmd docs floating in your project folder, so that is the biggest con. 

- **Bookdown**: 

- **Blogdown**: 

## Meta

Consider sharing advice re: meta content needed (like links to all the things, schedule)

## Showtime

Publish/deploy (general advice)
