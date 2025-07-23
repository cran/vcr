## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(vcr)

## -----------------------------------------------------------------------------
vcr_configure(filter_request_headers = "password")
vcr_configure(filter_response_headers = c("secret1", "secret2"))

## -----------------------------------------------------------------------------
vcr_configure(filter_request_headers = list(password = "<password>"))
vcr_configure(
  filter_response_headers = list(
    secret1 = "<secret1>",
    secret2 = "<secret2>"
  )
)

## -----------------------------------------------------------------------------
# vcr_configure(
#   filter_sensitive_data = list("<api_key>" = Sys.getenv('MY_API_KEY'))
# )

