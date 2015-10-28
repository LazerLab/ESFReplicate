#'  \code{strip0}
#'
#'  remove leading zeros, set significant digits
#'
#'  @param val numeric (or character with numbers) to reformat
#'  @param digits integer, number of significant digits
#'
#'  @return character
#'
#'  @export
#'
strip0 <- function(val, digits = 2L)
{
  sub("^(-?)0.", "\\1.", sprintf("%.*f", digits, val))
}
