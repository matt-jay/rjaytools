#' Create a time stamp of now as character string for use in file names
#'
#' This function is intended for use in building file names for exports. It
#' creates a time stamp based on \code{\link{now}}.
#'
#' @param time A boolean flag to determine whether the time should be included
#'   in the time stamp
#'
#' @param string.date A character string defining a pure date format to return
#'   as time stamp.
#'
#' @param string.datetime A character string defining a date/time format to
#'   return as time stamp.
#'
#' @return A character string with the time stamp.
#'
#' @examples
#' get_timestamp()
#'
#' get_timestamp(T)
#'
#' # change date format
#' get_timestamp(string.date = '%d-%m-%Y')
#'
#' # change date/time format
#' get_timestamp(T, string.datetime = '%d-%m-%Y-%H%M')
#'
get_timestamp <- function(time = F, string.date = "%Y-%m-%d", string.datetime = "%Y-%m-%d_%H%M%S") {

  ts <- dplyr::case_when(time == T ~ format(lubridate::now(), string.datetime), TRUE ~ format(lubridate::now(), string.date))

    return(ts)
}
