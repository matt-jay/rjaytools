#' Write a data frame to the clipboard.
#'
#' This function is a wrapper around \code{\link{write.table}},
#' essentially setting its \code{file} parameter to \code{pipe("pbcopy")}.
#'
#' @inheritParams utils::write.table
#' @examples
#' library(datasets)
#' data(mtcars)
#' copy_cb(mtcars)
#' copy_cb(mtcars[1:4], ',', F)

copy_cb = function(x, sep = ";", col.names = T) {
    utils::write.table(x, file = pipe("pbcopy"), sep = sep, row.names = F, col.names = col.names,
        quote = T, na = "")
}
