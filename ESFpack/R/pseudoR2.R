#' \code{pseudoR2}
#'
#'  report various model fit measures (adapted from pR2 in pscl package)
#'
#'  @param object object of class est
#'  @return vector of summary statistics
#'
#'  @export
#'
pseudoR2 <- function (object)
{
  object <- object$fitted_model
  llh <- logLik(object)
  objectNull <- update(object, ~1, data = object$data)
  llhNull <- logLik(objectNull)
  n <- dim(object$model)[1]
  McFadden <- 1 - llh / llhNull
  G2 <- -2 * (llhNull - llh)
  r2ML <- 1 - exp(-G2/n)
  r2ML.max <- 1 - exp(llhNull * 2 / n)
  r2CU <- r2ML / r2ML.max
  out <- c(llh = llh, llhNull = llhNull, G2 = G2, McFadden = McFadden,
    r2ML = r2ML, r2CU = r2CU)
  out
}
