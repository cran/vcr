## ----echo=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE
)

## ----setup--------------------------------------------------------------------
library(vcr)
library(testthat)
library(httr2, warn.conflicts = FALSE)

httpbin <- webfakes::local_app_process(webfakes::httpbin_app())

## -----------------------------------------------------------------------------
# Don't record any cassette for this vignette so they're always created afresh
vcr_configure(dir = tempdir())

## -----------------------------------------------------------------------------
test_that("my test", {
  vcr::local_cassette("get")

  req <- request(httpbin$url("/get"))
  resp <- req_perform(req)
  json <- resp_body_json(resp)

  expect_named(json, c("args", "headers", "origin", "path", "url"))
})

## -----------------------------------------------------------------------------
test_that("my test", {
  vcr::local_vcr_configure_log(file = stdout())
  vcr::local_cassette("get")

  req <- request(httpbin$url("/get"))
  resp <- req_perform(req)
  json <- resp_body_json(resp)

  expect_named(json, c("args", "headers", "origin", "path", "url"))
})

## -----------------------------------------------------------------------------
cat("```yaml\n")
writeLines(readLines(file.path(cassette_path(), "get.yml")))
cat("\n```")

## -----------------------------------------------------------------------------
# A pretend function that would normally be found somewhere in `R/`
get_data <- function(b = 1) {
  req <- request(httpbin$url("/post"))
  req <- req_body_json(req, list(x = 1, y = list(a = 1, b = b)))
  resp <- req_perform(req)

  resp_body_json(resp)
}

# A pretend test that would normally be found in `test/testthat/`.
test_that("my test", {
  vcr::local_vcr_configure_log(file = stdout())
  vcr::local_cassette(
    "body",
    match_requests_on = c("method", "uri", "body_json")
  )

  data <- get_data(b = 1)
  expect_named(data$json, c("x", "y"))
})

## -----------------------------------------------------------------------------
try({
test_that("my test", {
  vcr::local_vcr_configure_log(file = stdout())
  vcr::local_cassette(
    "body",
    match_requests_on = c("method", "uri", "body_json")
  )

  data <- get_data(b = 2)
  expect_named(data$json, c("x", "y"))
})
})

## -----------------------------------------------------------------------------
try({
test_that("my test", {
  vcr::local_vcr_configure_log(file = stdout())
  vcr::local_cassette("body", match_requests_on = c("method", "uri", "body"))

  data <- get_data(b = 2)
  expect_named(data$json, c("x", "y"))
})
})

