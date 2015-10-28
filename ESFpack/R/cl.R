#'  \code{cl}
#'
#'  Calculate clustered standard errors
#'
#'  @param data data.frame to use
#'  @param model fitted model from glm
#'  @param cluster integer vector of group indices
#'
#'  @return output from coeftest
#'
#'  @import lmtest
#'  @import sandwich
#'
#'  @export
#'
cl <- function(data, model, cluster)
{
  M <- length(unique(cluster))
  N <- length(cluster)
  K <- model$rank
  dfc <- (M / (M - 1)) * ((N - 1) / (N - K))
  uj <- apply(sandwich::estfun(model), 2, function(x) tapply(x, cluster, sum))
  vcov <- dfc * sandwich::sandwich(model, meat. = crossprod(uj) / N)
  lmtest::coeftest(model, vcov)
}
