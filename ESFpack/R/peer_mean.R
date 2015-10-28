#'  \code{peer_mean}
#'
#'  calculate peer summary
#'
#'  @param netx adjacency matrix of ties
#'  @param attrx data.frame of node-levels variables
#'  @param varname character, variable name from attrx
#'  @param tie character, type type (both, in, out)
#'
#'  @return data.frame
#'
#'  @export
#'
peer_mean <- function(netx, attrx, varname = "vint", tie = "both")
{
  if (sum(rownames(netx) != colnames(netx)) + sum(rownames(netx) != attrx$ID)) {
    stop("Incorrect data format.")
  }
  x <- attrx[, varname]
  mis <- is.na(x)
  x[mis] <- 0
  diag(netx) <- 0
  if (tie == "both") {
    n <- rowSums(netx) + colSums(netx) - mis %*% netx - mis %*% t(netx)
    y <- x %*% netx + x %*% t(netx)
  } else if (tie == "out") {
    n <- rowSums(netx) - mis %*% t(netx)
    y <- x %*% t(netx)
  } else if (tie == "in") {
    n <- colSums(netx) - mis %*% netx
    y <- x %*% netx
  } else {
    stop ("Wrong tie type")
  }
  out <- as.vector(y)
  out[n == 0] <- mean(x, na.rm = TRUE) # mean code missing values
  out[n != 0] <- out[n != 0] / n[n != 0]
  out
}
