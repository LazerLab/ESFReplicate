#'  \code{summary.est}
#'
#'  summarize results of estimation
#'
#'  @param object object of class est
#'  @param full logical, present all coefficients
#'  @param quietly logical, print results to screen
#'  @param coef_type character, type of coefficients to show (as.is, OR, prob, or
#'      perc.change)
#'  @param ... don't use this
#'
#'  @return data.frame, invisibly
#'
#'  @export
#'
summary.est <- function(object, full = FALSE, quietly = FALSE,
  coef_type = "as.is", ...)
{
  if ("cblest" %in% class(object)) {
    vars <- object$cont
    if (full) {
      vars <- names(object$fitted_model$coefficients)
      vars <- vars[!grepl("factor", vars)]
    }
    vars <- which(names(object$fitted_model$coefficients) %in% vars)
    est <- coef(object$fitted_model)[vars]
    boot_SE <- object$bootse$se[vars]
    boot_P <- object$bootse$p.values[vars]
    q025 <- object$bootse$ci[vars, 1]
    q975 <- object$bootse$ci[vars, 2]
    N <- object$fitted_model$n
    boot_Sig <- sapply(boot_P, add_stars)
    results <- data.frame(Est = est, SE = boot_SE, P = boot_P, q025 = q025,
      q975 = q975, N = N, Sig = boot_Sig)
  } else if ("miest" %in% class(object)) {
    vars <- object$treat
    if (full) {
      vars <- colnames(object$pooled_mi$qhat)
      vars <- vars[!grepl("factor", vars)]
    }
    results <- as.data.frame(
      summary(object$pooled_mi))[vars, c(1, 2, 5:7)]
    rownames(results) <- sub("1", "", rownames(results))
    colnames(results) <- c("Est", "SE", "P", "Lo 95", "Hi 95")
    results$N <- object$N
    results$Sig <- sapply(results$P, add_stars)
  }
  cols <- c(1, 2, 4, 5)
  if (coef_type == "OR") {
    results[, cols] <- round(exp(results[,  cols]), 2)
  } else if (coef_type == "prob") {
    results[, cols] <- round(apply(results[,  cols], c(1, 2), plogis), 2)
  } else if (coef_type == "perc.change") {
    results[, cols] <- round(100 * (exp(results[,  cols]) - 1), 2)
  }
  if (!quietly) {
    print(results)
  }
  invisible(results)
}
