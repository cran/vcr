## ----echo=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(
	comment = "#>",
	collapse = TRUE,
	warning = FALSE,
	message = FALSE,
  eval = FALSE
)

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("vcr")

## ----eval=FALSE---------------------------------------------------------------
#  remotes::install_github("ropensci/vcr")

## -----------------------------------------------------------------------------
#  library("vcr")

## ---- echo=FALSE, message=FALSE-----------------------------------------------
library("vcr")

## ----echo=FALSE, results='hide', eval=identical(Sys.getenv("IN_PKGDOWN"), "true")----
#  suppressPackageStartupMessages(require(vcr, quietly = TRUE))
#  unlink(file.path(cassette_path(), "helloworld.yml"))
#  vcr_configure(dir = tempdir())

## ---- eval=identical(Sys.getenv("IN_PKGDOWN"), "true")------------------------
#  library(vcr)
#  library(crul)
#  
#  cli <- crul::HttpClient$new(url = "https://eu.httpbin.org")
#  system.time(
#    use_cassette(name = "helloworld", {
#      cli$get("get")
#    })
#  )

## ---- eval=identical(Sys.getenv("IN_PKGDOWN"), "true")------------------------
#  system.time(
#    use_cassette(name = "helloworld", {
#      cli$get("get")
#    })
#  )

## ----echo=FALSE, eval=identical(Sys.getenv("IN_PKGDOWN"), "true")-------------
#  unlink(file.path(cassette_path(), "helloworld.yml"))

## ---- echo = FALSE, results='asis', collapse=TRUE-----------------------------
defaults <- rev(vcr_config_defaults())
defaults[unlist(lapply(defaults, is.character))] <- paste0('"', defaults[unlist(lapply(defaults, is.character))], '"')
cat(sprintf("* %s = `%s`\n", names(defaults), defaults))

## -----------------------------------------------------------------------------
vcr_configuration()

## ----echo=FALSE---------------------------------------------------------------
unlink(file.path(cassette_path(), "one.yml"))

## ----eval = FALSE-------------------------------------------------------------
#  use_cassette(name = "one", {
#      cli$post("post", body = list(a = 5))
#    },
#    match_requests_on = c('method', 'headers', 'body')
#  )

