## ----echo=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    warning = FALSE,
    message = FALSE
)

## ----setup--------------------------------------------------------------------
library("vcr")

## -----------------------------------------------------------------------------
tmpdir <- tempdir()
vcr_configure(
  dir = file.path(tmpdir, "fixtures"),
  write_disk_path = file.path(tmpdir, "files")
)

## -----------------------------------------------------------------------------
library(crul)
## make a temp file
f <- tempfile(fileext = ".json")
## make a request
cas <- use_cassette("test_write_to_disk", {
  out <- HttpClient$new("https://httpbin.org/get")$get(disk = f)
})
file.exists(out$content)
out$parse()

## ----echo=FALSE---------------------------------------------------------------
invisible(vcr_configure_reset())

