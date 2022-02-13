#' ---
#' title: 'Data Report Tools'
#' author: 'E. H. Markowitz'
#' purpose: Store functions
#' start date: 2022-02-15
#' date modified:         # CHANGE
#' Notes:                             # CHANGE
#' ---

#############INSTALL PACKAGES##############
# Here we list all the packages we will need for this whole process
# We'll also use this in our works cited page!!!
PKG <- c(
  # For creating R Markdown Docs
  "knitr", # A general-purpose tool for dynamic report generation in R
  "rmarkdown", # R Markdown Document Conversion
  
  # File Management
  # "here", # For finding the root directory of your scripts and thus, find your files
  # "officer",
  
  # Keeping Organized
  "devtools", # Package development tools for R; used here for downloading packages from GitHub
  # "renv", # saves the packages in the R environment
  
  
  # Graphics
  "ggplot2", # Create Elegant Data Visualisations Using the Grammar of Graphics
  "cowplot",
  "png",
  "extrafont",
  "ggpubr",
  "nmfspalette",  # devtools::install_github("nmfs-general-modeling-tools/nmfspalette")
  "ggridges",
  
  # Text
  "NMFSReports", # devtools::install_github("emilymarkowitz-noaa/NMFSReports") # Package of my favorite grammar and file managment functions for writing reproducible reports
  
  # Citations
  "knitcitations", # devtools::install_github("cboettig/knitcitations")
  
  # other tidyverse
  "dplyr",
  "googledrive",
  "magrittr",
  "readr",
  "tidyr",
  
  # Text Management
  "stringr",
  "readtext",
  
  # RACE-GAP Specific
  "akgfmaps", # devtools::install_github("sean-rohan-noaa/akgfmaps", build_vignettes = TRUE)
  "coldpool", # devtools::install_github("sean-rohan-noaa/coldpool")
  
  
  # Spatial
  "sf",
  "rlist", 
  "jsonlite", 
  "prettymapr",
  "rgdal", 
  "rosm", 
  "shadowtext", 
  "ggspatial", 
  "digest", 
  "ggsn",
  "rgdal", 
  "ps", 
  "backports", 
  "callr", 
  "labeling", 
  "gstat", 
  "magrittr", 
  "raster", 
  "reshape", 
  "stars",
  "grid", 
  
  # library(rasterVis)
  # library(scales)
  # library(ggthemes) # theme_map()
  
  # check website links
  "pingr",
  "httr",
  
  
  # Time
  # "lubridate",
  
  # Species
  # "taxize", 
  
  # For outputting JS files
  # "jsonlite", 
  
  # Tables
  "officer", 
  "flextable", 
  
  # For editing XML files
  "XML", 
  
  # Oracle
  "RODBC")


# https://pkgdown.r-lib.org/reference/build_site.html

# Wish list

# Links to figures and tables in text
# https://holtzy.github.io/Pimp-my-rmd/#internal_link

########### Document Package ############
.rs.restartR()

# options(rmarkdown.html_vignette.check_title = FALSE)
Sys.setenv('PATH' = paste0('C:/Program Files/qpdf-10.0.1/bin;', Sys.getenv('PATH')))
library(here)
library(devtools)
library(roxygen2)
# rmarkdown::render(paste0(dir_code, "/README.Rmd"),
#                   output_dir = here::here(),
#                   output_file = paste0("README.md"))
devtools::document()
setwd("..")
install("NMFSReports")
3
setwd(here::here())
# devtools::check()

########### Create Documentation GitHub-Pages ############

.rs.restartR()
# devtools::install_github("rstudio/fontawesome", force = T)
# library(fontawesome)
library(here)
library(usethis)
library(pkgdown)
# options(rmarkdown.html_vignette.check_title = FALSE)

# git rm -r --cached .
options(rmarkdown.html_vignette.check_title = FALSE)
# pkgdown::build_favicons()
devtools::build_vignettes()
usethis::use_pkgdown(config_file = "./pkgdown/_pkgdown.yml")
pkgdown::build_site(pkg = here::here())
# usethis::use_github_action("pkgdown")

# usethis::use_github_pages(branch = "main", path = "/docs", cname = NA)

# template:
#   params:
#   bootswatch: sandstone

########### Submit to CRAN ############

# devtools::check() # add the console output to cran-commentes.md
# devtools::check_rhub() # check that your email is 'validated.' You'll need a token emailed to you
# devtools::check_win_devel()
# devtools::release()

##########build a vignette#########

# usethis::use_vignette("A_buildReport-test")
# usethis::use_vignette("ScriptLayout")
# usethis::use_vignette("ExampleRunFile")
# usethis::use_vignette("InitialSetUp")

#########NOTES#########

# bootstrap shiny design
# https://gallery.shinyapps.io/117-shinythemes/

# Guide for checking CMD CHECK()
#    https://r-pkgs.org/r-cmd-check.html

# loading qpdf:
#    https://stackoverflow.com/questions/41570633/how-to-build-qpdf-on-windows
#    https://stackoverflow.com/questions/15035150/r-cmd-check-as-cran-warning
#    https://sourceforge.net/projects/qpdf/files/qpdf/10.0.1/
#    Sys.setenv('PATH' = paste0('C:/Program Files/qpdf-10.0.1/bin;', Sys.getenv('PATH')))
#    Sys.which(Sys.getenv("R_QPDF", "qpdf"))

# Compress Files
#    https://stackoverflow.com/questions/10233593/how-to-effectively-deal-with-uncompressed-saves-during-package-check
#    save(land, file="./data/sysdata.rda", compress='xz')

# Add a favicon
#    https://github.com/r-lib/pkgdown/issues/379

# Licence
#   https://stackoverflow.com/questions/56102225/r-devtoolscheck-license-is-not-mentioned-and-other-issues-in-description-file

# Dealing with "no visible binding for global variable '*'"
#   https://stackoverflow.com/questions/9439256/how-can-i-handle-r-cmd-check-no-visible-binding-for-global-variable-notes-when

# clean up gitignore
#   https://stackoverflow.com/questions/48955103/non-standard-file-directory-found-at-top-level-readme-rmd-persists-even-after

# Make code citable
#   https://guides.github.com/activities/citable-code/

# General Reference
#   https://github.com/timjmiller/wham/blob/master/DESCRIPTION
#   date: "`r format(Sys.Date(), format='%B %d %Y') `"

#https://github.com/r-lib/pkgdown/issues/379


