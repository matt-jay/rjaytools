% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_timestamp.R
\name{get_timestamp}
\alias{get_timestamp}
\title{Create a time stamp of now as character string for use in file names}
\usage{
get_timestamp(time = F, string.date = "\%Y-\%m-\%d",
  string.datetime = "\%Y-\%m-\%d_\%H\%M\%S")
}
\arguments{
\item{time}{A boolean flag to determine whether the time should be included
in the time stamp}

\item{string.date}{A character string defining a pure date format to return
as time stamp.}

\item{string.datetime}{A character string defining a date/time format to
return as time stamp.}
}
\value{
A character string with the time stamp.
}
\description{
This function is intended for use in building file names for exports. It
creates a time stamp based on \code{\link{now}}.
}
\examples{
get_timestamp()

get_timestamp(T)

# change date format
get_timestamp(string.date = '\%d-\%m-\%Y')

# change date/time format
get_timestamp(T, string.datetime = '\%d-\%m-\%Y-\%H\%M')

}
