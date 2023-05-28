#' This package will create a function called create_guelphdown_project()
#'
#' It's callback is at: inst/rstudio/templates/project/create_project.dcf
#'
#' @export
create_guelphdown_project <- function(path = getwd()) {

  # from https://github.com/rstudio/bookdown/blob/master/R/skeleton.R
  # ensure directory exists
  #  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources <- guelphdown_file('rstudio', 'templates', 'project', 'resources')

  R.utils::copyDirectory(from = resources,
                         to = path,
                         recursive = TRUE)
}

guelphdown_file <- function(...) {

  # from https://github.com/rstudio/bookdown/blob/master/R/utils.R
  system.file(..., package = 'guelphdown', mustWork = TRUE)
}


