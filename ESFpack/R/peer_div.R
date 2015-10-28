#'  \code{peer_div}
#'
#'  Calculate summary peer diversity values
#'
#'  @param netx adjacency matrix of ties
#'  @param attrx data.frame of node-levels variables
#'  @param varname character, variable name to output
#'  @param tie character, tie type (both, in, out)
#'
#'  @return data.frame
#'
#'  @export
#'
peer_div <- function(netx, attrx, varname = "ideomd", tie = "both")
{
  # require(ineq, quietly = TRUE)
  n <- nrow(netx)
  out <- data.frame(ideomd = rep(0, n), ideosd0 = rep(0, n),
    party.hhi = rep(0, n), party.rhhi = rep(0, n))
  isolate <- rep(FALSE,  n)
  ideo <- attrx[, "Ideology"]
  party <- attrx[, "PolitPref"]
  for (i in seq_len(n)) {
    if (tie == "out") {
      friends <- netx[i, ]
    }
    if (tie == "in") {
      friends <- netx[, i]
    }
    if (tie == "both") {
      friends <- c(netx[i, ], netx[, i])
      ideo <- c(attrx[, "Ideology"], attrx[, "Ideology"])
      party <- c(attrx[, "PolitPref"], attrx[, "PolitPref"])
    }
    if (sum(friends > 0) == 0) {
      isolate[i] <- TRUE
      next
    }
    out$ideomd[i] <- mean(abs(ideo[friends > 0] - ideo[i]), na.rm = TRUE)
    out$ideosd0[i] <- sd(ideo[friends > 0], na.rm = TRUE)
    calc_hhi <- function(x) {
      x <- as.numeric(na.omit(x))
      sum((x / sum(x)) ^ 2)
    }
    out$party.hhi[i] <- calc_hhi(x = table(party[friends > 0]))
    out$party.rhhi[i] <- 1 - out$party.hhi[i]
    if (is.nan(out$ideomd[i]) | is.infinite(out$ideomd[i])) {
      out$ideomd[i] <- NA
    }
    if (is.nan(out$ideosd0[i]) | is.infinite(out$ideosd0[i])) {
      out$ideosd0[i] <- NA
    }
    if (is.nan(out$party.hhi[i]) | is.infinite(out$party.hhi[i])) {
      out$party.hhi[i] <- NA
    }
    if (is.nan(out$party.rhhi[i]) | is.infinite(out$party.rhhi[i])) {
      out$party.rhhi[i] <- NA
    }
  }
  out$ideomd[isolate] <- mean(out$ideomd[!isolate], na.rm = TRUE)
  out$ideosd0[isolate] <- 0
  out$party.hhi[isolate] <- 1
  out$party.rhhi[isolate] <- 0
  out[, varname]
}
