#'  \code{marg_gen}
#'
#'  Calculate marginal effects
#'
#'  @param object est object
#'  @param peer_int comparison value
#'  @param peer_ref reference value
#'  @param peer_varname peer effect variable name
#'  @param cond_varname conditional effect variable name
#'  @param cond_value conditional effect value
#'
#'  @return data.frame summarizing marginal effects
#'
#'  @export
#'
marg_gen <- function(object, peer_int = 0.2, peer_ref = c(1, 5),
  peer_varname = NULL, cond_varname = NULL, cond_value = NULL)
{
  means <- c(Intercept = 1, colMeans(model.frame(object$fitted_model))[-1])
  means <- as.data.frame(t(means))
  peer_vals <- seq(peer_ref[1], peer_ref[2], peer_int)
  if (is.null(peer_varname)) {
    peer_varname <- object$cont
  }
  if (!is.null(cond_varname) & !is.null(cond_value)) {
    means[, cond_varname] <- cond_value
  }
  response <- colnames(object$fitted_model$model)[1]
  out <- data.frame(peer_vals, NA, NA, NA, NA, peer_varname, response, object$year[1])
  colnames(out) <- c("Tie.Voting", "Voting", "SE", "LB", "UB", "Treat",
    "Response", "Year")
  means <- means[rep(1, length(peer_vals)), ]
  means[, peer_varname] <- peer_vals
  pred <- predict(object$fitted_model, means, type = "link", se.fit = TRUE)
  out[, 2] <- plogis(pred$fit)
  out[, 3] <- plogis(pred$se.fit)
  out[, 4] <- plogis(pred$fit - qnorm(.975) * pred$se.fit)
  out[, 5] <- plogis(pred$fit + qnorm(.975) * pred$se.fit)
  out
}
