#'  \code{add_stars}
#'
#'  add stars to coefficients
#'
#'  @param p numeric, p values
#'  @param t numeric, t values
#'  @param df integer, degrees of freedom
#'
#'  @return character string, with significance codes "***" = 0.001,
#'    "**" = 0.01, "*" = 0.05, "." =  0.1
#'
#'  @examples
#'  add_stars(seq(0, .2, .01))
#'
#'  @export
#'
add_stars <- function(p = NULL, t = NULL, df = NULL)
{
  s <- ""
  if (!is.null(p)) {
    if (p < 0.001) {
      s <- "***"
    } else if (p < 0.01) {
      s <- "**"
    } else if (p < 0.05) {
      s <- "*"
    } else if (p < 0.1) {
      s <- "."
    }
  }
#   if (!is.null(t)) {
#     if (abs(t) > abs(qt(.9995, l - length(t)))) {
#       s <- "***"
#     } else if (abs(t) > abs(qt(.9950, l - length(t)))) {
#       s <- "**"
#     } else if (abs(t) > abs(qt(.9750, l - length(t)))) {
#       s <- "*"
#     } else if (abs(t) > abs(qt(.9500, l - length(t)))) {
#       s <- "."
#     }
#   }
  s
}
