#'  \code{print.est}
#'
#' print output from estimate or mi_estimate
#'
#'  @param x a fitted model
#'  @param ... don't use this
#'  @return argument x, invisibly
#'
#'  @export
#'
print.est <- function(x, ...)
{
  summary(x)
  invisible(x)
}
