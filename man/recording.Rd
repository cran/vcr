% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recording.R
\name{recording}
\alias{recording}
\title{vcr recording options}
\description{
vcr recording options
}
\details{
Record modes dictate under what circumstances http requests/responses
are recorded to cassettes (disk). Set the recording mode with the
parameter \code{record} in the \code{use_cassette()} and \code{insert_cassette()}
functions.
\subsection{once}{

The \code{once} record mode will:
\itemize{
\item Replay previously recorded interactions.
\item Record new interactions if there is no cassette file.
\item Cause an error to be raised for new requests if there is a cassette
file.
}

It is similar to the \code{new_episodes} record mode, but will prevent new,
unexpected requests from being made (i.e. because the request URI
changed or whatever).

\code{once} is the default record mode, used when you do not set one.
}

\subsection{none}{

The \code{none} record mode will:
\itemize{
\item Replay previously recorded interactions.
\item Cause an error to be raised for any new requests.
}

This is useful when your code makes potentially dangerous HTTP requests.
The \code{none} record mode guarantees that no new HTTP requests will be
made.
}

\subsection{new_episodes}{

The \code{new_episodes} record mode will:
\itemize{
\item Record new interactions.
\item Replay previously recorded interactions.
}

It is similar to the \code{once} record mode, but will \strong{always} record new
interactions, even if you have an existing recorded one that is similar
(but not identical, based on the \code{match_request_on} option).
}

\subsection{all}{

The \code{all} record mode will:
\itemize{
\item Record new interactions.
\item Never replay previously recorded interactions.
}

This can be temporarily used to force vcr to re-record a cassette
(i.e. to ensure the responses are not out of date) or can be used when
you simply want to log all HTTP requests.
}
}
