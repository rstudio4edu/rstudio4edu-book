# Caring for your site {#rmd-care}




<img src="images/illos/rmd-care.jpg" width="65%" style="display: block; margin: auto;" />

Once you have the website in place, it's likely that you will want to update it periodically or add new pages. The key to updating is that you must build your site or use `rmarkdown::render_site()` each time before you push to GitHub--otherwise your changes wouldn't make it into your `docs/` folder. And if it's not in the `docs/` then GitHub pages will not be able to find it. 

Here's what the add-new-pages workflow looks like for me:

1. **Open** the existing site RStudio project
2. **Run** "Build Site" or `rmarkdown::render_site()` right away to see where things left off.
3. **Create** a new `.Rmd` document in RStudio using *File > New File > R Markdown*, and delete its default YAML except for the title, then edit away.
4. **Update** your `_site.yml` by adding the new page's `.html` file to the navbar section. **Note: It's very easy to forget this step!!**
6. **Run** `rmarkdown::render_site()` to stitch everything together.
7. **Rinse and repeat** if needed!
8. **Commit and push** all changes to GitHub.

## Hiding pages {#hide-rmd}

<img src="images/illos/rmd-hide.jpg" width="40%" style="display: block; margin: auto;" />
Have an R Markdown file that you'd like to keep under wraps? If you leave it off of your navbar and don't link to it elsewhere, then it's unlikely anyone will ever see it, but it will still be rendered when you build your site. If you don't want the `.Rmd` to be rendered at all, then save it with a filename that begins with an underscore `_`. All files with underscores get passed over when it's time to render the site (but they'll still be in your repository).


## Staying organized

- Say something about all the files
- You *could* group your Rmds into folders-- a folder for labs, a folder for readings, etc. But the downside is that you'd have to knit each file in the directory individually in order for it to end up in the docs/ folder. But then the following scenario can happen:

<running to class, pages not updated, takes a long time, blerghh>


## Troubleshooting
-did you forget to knit a page-- click build site.
-inspect your docs folder
-can always delete your docs/ folder and have a fresh start. rebuild site.
-triple check your YAML

