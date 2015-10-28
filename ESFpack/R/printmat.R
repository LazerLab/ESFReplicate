#'  \code{printmat}
#'
#'  Format a matrix of results (for internal use)
#'
#'  @param m matrix
#'  @return results of write.table
#'
#'  @export
#'
printmat <- function(m)
{
  write.table(format(m, justify = "right"), row.names = FALSE,
    col.names = FALSE, quote = FALSE, sep = "   ")
}
