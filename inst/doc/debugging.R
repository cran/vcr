## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
# We want to re-record these cassettes every time
vcr::vcr_configure(dir = tempdir())

## ----setup--------------------------------------------------------------------
library(vcr)
library(httr2)
httpbin <- webfakes::local_app_process(webfakes::httpbin_app())

## -----------------------------------------------------------------------------
# Override default logging output so we don't need to explain the difference
# between logging in vignettes and tests, and the reader can just copy and 
# paste code
local_vcr_configure_log <- function(..., frame = parent.frame()) {
  vcr::local_vcr_configure_log(..., file = stdout(), frame = frame)
}

# Make a dummy test_that() that basically works the same way as local()
# Using testthat::test_that() adds a bit too much noise to the examples.
test_that <- function(desc, code) {
  eval(substitute(code), new.env(parent = parent.frame()))
}

## -----------------------------------------------------------------------------
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-1")

  req <- request(httpbin$url("/get"))
  resp <- req_perform(req)
})

## -----------------------------------------------------------------------------
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-1")

  req <- request(httpbin$url("/get"))
  resp <- req_perform(req)
})

## -----------------------------------------------------------------------------
try({
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-1")

  req <- request(httpbin$url("/get")) |> req_method("POST")
  resp <- req_perform(req)
})
})

## -----------------------------------------------------------------------------
try({
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-1")

  req <- request(httpbin$url("/set"))
  resp <- req_perform(req)
})
})

## -----------------------------------------------------------------------------
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-2")

  resp1 <- req_perform(request(httpbin$url("/get?x=1")))
  resp2 <- req_perform(request(httpbin$url("/get?x=2")))
  resp3 <- req_perform(request(httpbin$url("/get?x=3")))
})

## -----------------------------------------------------------------------------
try({
test_that("example test", {
  local_vcr_configure_log()
  local_cassette("debugging-2")

  resp4 <- req_perform(request(httpbin$url("/get?x=4")))
})
})

## -----------------------------------------------------------------------------
try({
# Imagine this function is in R/
make_request <- function() {
  nonce <- paste0(sample(letters, 10, replace = TRUE), collapse = "")

  req <- request(httpbin$url("/get")) 
  req <- req_url_query(req, nonce = nonce)
  req_perform(req)
}

# And this code is in tests/testthat/
test_that("example test", { 
  local_cassette("nondeterministic")
  
  resp <- make_request()
})

test_that("example test", { 
  local_vcr_configure_log()
  local_cassette("nondeterministic")
  
  resp <- make_request()
})
})

## -----------------------------------------------------------------------------
test_that("example test", { 
  local_vcr_configure_log()
  local_vcr_configure(filter_query_parameters = "nonce")
  local_cassette("nondeterministic")
  
  resp <- make_request()
})

