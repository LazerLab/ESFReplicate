#'  \code{pool_r2}
#'
#'  Compute pooled R squared
#'
#'  @param object object of class miest (mira)
#'  @param adjusted use adjusted R2?
#'
#'  @return data.frame of results
#'
#'  @export
#'
pool_r2 <- function (object, adjusted = FALSE)
{
  call <- match.call()
  if (!mice::is.mira(object)) {
    stop("The object must have class 'mira'")
  }
  if ((m <- length(object$analyses)) < 2) {
    stop("At least two imputations are needed for pooling.\n")
  }
  analyses <- object$analyses
  m <- length(analyses)
  r2 <- matrix(NA, nrow = m, ncol = 3,
    dimnames = list(seq_len(m), c("R^2", "Fisher trans F^2", "se()")))
  for (i in seq_len(m)) {
    fit <- analyses[[i]]
    summ <- summary(fit)
    if (!adjusted) {
      r2[i, 1] <- sqrt(summ$r.squared)
    } else {
      r2[i, 1] <- sqrt(summ$adj.r.squared)
    }
    r2[i, 2] <- 0.5 * log((1 + r2[i, 1]) / (1 - r2[i, 1]))
    r2[i, 3] <- 1 / (length(summ$residuals) - 3)
  }
  fit <- mice::pool.scalar(r2[, 2], r2[, 3])
  R2 <- function(x) {
    ((exp(2 * x) - 1) / (1 + exp(2 * x))) ^ 2
  }
  table <- array(R2(fit$qbar), dim = c(1, 4))
  if (!adjusted) {
    dimnames(table) <- list("R^2", c("est", "lo 95", "hi 95", "fmi"))
  }  else {
    dimnames(table) <- list("adj R^2", c("est", "lo 95", "hi 95", "fmi"))
  }
  table[, 2] <- R2(fit$qbar - qnorm(.975) * sqrt(fit$t))
  table[, 3] <- R2(fit$qbar + qnorm(.975) * sqrt(fit$t))
  table[, 4] <- fit$f
  table
}
