% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as-casette.R
\name{as.cassette}
\alias{as.cassette}
\alias{as.cassettepath}
\title{Coerce names, etc. to cassettes}
\usage{
as.cassette(x, ...)

as.cassettepath(x)
}
\arguments{
\item{x}{Input, a cassette name (character), or something that
can be coerced to a cassette}

\item{...}{further arguments passed on to \code{\link[=cassettes]{cassettes()}} or
[read_cassette_meta()}
}
\value{
a cassette of class \code{Cassette}
}
\description{
Coerce names, etc. to cassettes

Coerce to a cassette path
}
\examples{
\dontrun{
vcr_configure(dir = tempfile())
insert_cassette("foobar")
cassettes(on_disk = FALSE)
cassettes(on_disk = TRUE)
as.cassette("foobar", on_disk = FALSE)
eject_cassette() # eject the current cassette

# cleanup
unlink(file.path(tempfile(), "foobar.yml"))
}
}
