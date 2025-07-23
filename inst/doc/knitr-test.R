## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(vcr)
library(httr2)
httpbin <- webfakes::local_app_process(webfakes::httpbin_app())

# Set record = "none" so that this vignette will fail if it doesn't replay
# from the cassette
vcr::setup_knitr(record = "none")

## -----------------------------------------------------------------------------
req <- request(httpbin$url("/get"))
req_perform(req)

## -----------------------------------------------------------------------------
req <- request(httpbin$url("/get?x=1"))
req_perform(req)

