#'  \code{format_object}
#'
#'  Format the ouput from a single model object (for internal use)
#'
#'  @param object est object
#'  @param coef_type character, type of coefficients to show (as.is, OR, prob, or
#'      perc.change)
#'  @param SE logical, print SE if TRUE, CI if FALSE
#'
#'  @return character vector
#'
#'  @export
#'
format_object <- function(object, coef_type = "as.is", SE = TRUE)
{
  op <- options(stringsAsFactors = FALSE)
  on.exit(options(op))
  
  out <- summary(object, full = TRUE, quietly = TRUE, coef_type = coef_type)
  if (SE | "miest" %in% class(object)) {
    out$comb <- paste0(strip0(out$Est)," (", strip0(out$SE), ")", out$Sig)
  } else {
    out$comb <- paste0(strip0(out$Est),"\n[", strip0(out$q025), ", ",
      strip0(out$q975), "]", out$Sig)
  }
  rownames(out) <- pretty_var_names(rownames(out))
  if ("miest" %in% class(object)) {
    out <- rbind(out, N = object$N, R2 = strip0(object$R2, 2))
  }
  out <- data.frame(rownames(out), out$comb)
  colnames(out) <- c("Name", paste(
    paste(object$net, collapse = " & "),
    paste(object$year, collapse = ", ")))
  ok <- !grepl("^-", out[, 2])
  if (any(ok)) {
    out[ok, 2] <- paste0(" ", out[ok, 2])
  }
  if ("cblest" %in% class(object)) {
    pR2 <- pseudoR2(object)
    out <- rbind(out,
      c("Observations", object$fitted_model$n),
      c("AIC", round(object$fitted_model$aic), 0),
      c("Log-likelihood (fitted)", round(pR2["llh"], 0)),
      c("Log-likelihood (null)", round(pR2["llhNull"], 0)),
      c("-2(null LL - fitted LL)", round(pR2["G2"], 0)),
      c("McFadden pseudo R2", sprintf("%.2f", pR2["McFadden"])),
      c("Max. Like. pseudo R2", sprintf("%.2f", pR2["r2ML"])),
      c("Cragg & Uhler's pseudo R2", sprintf("%.2f", pR2["r2CU"])))
  }
  out
}
