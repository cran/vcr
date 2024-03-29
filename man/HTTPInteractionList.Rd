% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/http_interaction_list.R
\name{HTTPInteractionList}
\alias{HTTPInteractionList}
\title{HTTPInteractionList class}
\description{
keeps track of all \link{HTTPInteraction} objects
}
\details{
\strong{Private Methods}
\describe{
\item{\code{has_unused_interactions()}}{
Are there any unused interactions? returns boolean
}
\item{\code{matching_interaction_index_for()}}{
asdfadf
}
\item{\code{matching_used_interaction_for(request)}}{
asdfadfs
}
\item{\code{interaction_matches_request(request, interaction)}}{
Check if a request matches an interaction (logical)
}
\item{\code{from_hash()}}{
Get a hash back.
}
\item{\code{request_summary(z)}}{
Get a request summary (character)
}
\item{\code{response_summary(z)}}{
Get a response summary (character)
}
}
}
\examples{
\dontrun{
vcr_configure(
 dir = tempdir(),
 record = "once"
)

# make interactions
## make the request
### turn off mocking
crul::mock(FALSE)
url <- "https://eu.httpbin.org/post"
cli <- crul::HttpClient$new(url = url)
res <- cli$post(body = list(a = 5))

## request
(request <- Request$new("POST", url, list(a = 5), res$headers))
## response
(response <- VcrResponse$new(
   res$status_http(),
   res$response_headers,
   res$parse("UTF-8"),
   res$response_headers$status))
## make an interaction
(inter <- HTTPInteraction$new(request = request, response = response))

# make an interactionlist
(x <- HTTPInteractionList$new(
   interactions = list(inter),
   request_matchers = vcr_configuration()$match_requests_on
))
x$interactions
x$request_matchers
x$parent_list
x$parent_list$response_for()
x$parent_list$has_interaction_matching()
x$parent_list$has_used_interaction_matching()
x$parent_list$remaining_unused_interaction_count()
x$used_interactions
x$allow_playback_repeats
x$interactions
x$response_for(request)
}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{interactions}}{(list) list of interaction class objects}

\item{\code{request_matchers}}{(character) vector of request matchers}

\item{\code{allow_playback_repeats}}{whether to allow playback repeats}

\item{\code{parent_list}}{A list for empty objects, see \code{NullList}}

\item{\code{used_interactions}}{(list) Interactions that have been used}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-HTTPInteractionList-new}{\code{HTTPInteractionList$new()}}
\item \href{#method-HTTPInteractionList-response_for}{\code{HTTPInteractionList$response_for()}}
\item \href{#method-HTTPInteractionList-has_interaction_matching}{\code{HTTPInteractionList$has_interaction_matching()}}
\item \href{#method-HTTPInteractionList-has_used_interaction_matching}{\code{HTTPInteractionList$has_used_interaction_matching()}}
\item \href{#method-HTTPInteractionList-remaining_unused_interaction_count}{\code{HTTPInteractionList$remaining_unused_interaction_count()}}
\item \href{#method-HTTPInteractionList-assert_no_unused_interactions}{\code{HTTPInteractionList$assert_no_unused_interactions()}}
\item \href{#method-HTTPInteractionList-clone}{\code{HTTPInteractionList$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-new"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-new}{}}}
\subsection{Method \code{new()}}{
Create a new \code{HTTPInteractionList} object
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$new(
  interactions,
  request_matchers,
  allow_playback_repeats = FALSE,
  parent_list = NullList$new(),
  used_interactions = list()
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{interactions}}{(list) list of interaction class objects}

\item{\code{request_matchers}}{(character) vector of request matchers}

\item{\code{allow_playback_repeats}}{whether to allow playback repeats or not}

\item{\code{parent_list}}{A list for empty objects, see \code{NullList}}

\item{\code{used_interactions}}{(list) Interactions that have been used. That is,
interactions that are on disk in the current cassette, and a
request has been made that matches that interaction}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{HTTPInteractionList} object
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-response_for"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-response_for}{}}}
\subsection{Method \code{response_for()}}{
Check if there's a matching interaction, returns a
response object
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$response_for(request)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{request}}{The request from an object of class \code{HTTPInteraction}}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-has_interaction_matching"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-has_interaction_matching}{}}}
\subsection{Method \code{has_interaction_matching()}}{
Check if has a matching interaction
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$has_interaction_matching(request)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{request}}{The request from an object of class \code{HTTPInteraction}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
logical
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-has_used_interaction_matching"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-has_used_interaction_matching}{}}}
\subsection{Method \code{has_used_interaction_matching()}}{
check if has used interactions matching a given request
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$has_used_interaction_matching(request)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{request}}{The request from an object of class \code{HTTPInteraction}}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
logical
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-remaining_unused_interaction_count"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-remaining_unused_interaction_count}{}}}
\subsection{Method \code{remaining_unused_interaction_count()}}{
Number of unused interactions
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$remaining_unused_interaction_count()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
integer
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-assert_no_unused_interactions"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-assert_no_unused_interactions}{}}}
\subsection{Method \code{assert_no_unused_interactions()}}{
Checks if there are no unused interactions left.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$assert_no_unused_interactions()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
various
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-HTTPInteractionList-clone"></a>}}
\if{latex}{\out{\hypertarget{method-HTTPInteractionList-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HTTPInteractionList$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
