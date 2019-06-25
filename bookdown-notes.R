#Below will not work unless you've populated the DESCRIPTION FIRST

library(usethis)
use_package("dplyr")
use_package("ggplot2")
use_package("kableExtra")
use_package("tibble")
use_package("knitr")# add a CRAN package as a dependency

file.create(".travis.yml")

# Paste

# language: R
# cache:                          # optional
#   packages: true                # optional
# directories: _bookdown_files  # optional
# pandoc_version: 2.3.1
# 
# script:
#   - Rscript -e 'bookdown::render_book("index.Rmd")'
# 
# deploy:
#   provider: pages
# local_dir: _book
# skip_cleanup: true
# github-token: $GITHUB_PAT    # Set in the settings page 
# on:
#   branch: master


browse_travis(ext = "com")

#update gitignore to include
.Rproj.user
.Rhistory
.RData
.Ruserdata
_book
_bookdown_files
