#' Create a directory including full path outside of the working directory
#'
#' This function checks whether a directory in a given path exists and creates
#' it - including any missing directories in the path - if that is not the case.
#'
#' This function is generally useful in the setup process of any (part of a)
#' project where the existence of a specific directory is dependent on the first
#' execution of a related part of your code base.
#'
#' @param dir A character string defining the path to the directory that should
#'   be created
#'
#' @param fullPath A boolean flag indicating whether the directory string
#'   provided is a full path or not. If \code{FALSE}, \code{dir} is created in the user's
#'   home directory as defined by \code{Sys.getenv("HOME")}.
#'
#' @examples
#' create_dir('my/export/directory')
#'
#' create_dir('~/my/export/directory', TRUE)
#'
#' # using the get_file_path() function in jaytools
#' create_dir(get_file_path('my/export/directory'), TRUE)
#'

create_dir <- function(dir, fullPath = F) {

    if (fullPath) {
      path <- dir
    }
    else {

      # remove leading slash for relative paths
      if (substr(dir, 1, 1) == '/') {
        dir <- substr(dir, 2, nchar(dir))
      }

      # create path in user's home directory
      path <- paste0(Sys.getenv("HOME"), '/', dir)

    }

    path <- path.expand(path)

    # check if the target directory exists
    if (!file.exists(path)) {
        # create if not

        cat(paste0("[I] Setting up directory ", path, " ...\n"))

        # split path into folders
        x <- strsplit(path, "/", fixed = T)

        # walk down directory tree, creating all missing folders
        for (i in 2:length(x[[1]])) {

            tmpPath <- paste0(x[[1]][1:i], collapse = "/")

            if (!file.exists(tmpPath)) {

                cat(paste0("[I] Creating directory ", tmpPath, " ...\n"))
                dir.create(tmpPath)

            }
        }

    } else {
        # directory already exists
        cat(paste0("[I] Found directory ", path, " ...\n"))

    }

}
