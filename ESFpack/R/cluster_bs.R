#'  \code{cluster_bs}
#'
#'  Calculate bootstrapped clustered standard errors
#'
#'  @param model fitted model
#'  @param data data.frame to use in estimation
#'  @param cluster RHS formula to identify clusters
#'  @param ci_level numeric in (0, 1), level for inference
#'  @param boot_reps integer, number of bootstrap replicates
#'  @param stratify logical, should bootstrapping within clusters be done?
#'  @param cluster_se logical, use SEs clustered at cluster?
#'  @param report logical, print to screen?
#'  @param nonparametric logical, do nonparametric bootstrap? if FALSE do
#'      parametric
#'  @param parallel logical, use multiple cores?
#'
#'  @return list with p values, confidence intervals, and SEs
#'
#'  @export
#'
cluster_bs <- function(model, data, cluster, ci_level = 0.95, boot_reps = 1000L,
  stratify = FALSE, cluster_se = TRUE, report = TRUE, nonparametric = FALSE,
  parallel = TRUE)
{
  formula <- model$formula
  family <- model$family
  data_t <- subset(data, select = all.vars(formula))
  data_t$clust <- subset(data, select = all.vars(cluster))
  data <- na.omit(data_t)
  clust <- as.vector(unlist(data$clust))
  uniq_clust <- unique(clust)
  clust_list <- lapply(uniq_clust, function(g) which(clust == g))
  clust_length <- do.call(c, lapply(clust_list, length))
  G <- length(uniq_clust)
  indep_vars <- names(coefficients(model))
  indep_vars <- indep_vars[!grepl("factor", indep_vars)]
  k <- length(indep_vars)
  beta_model <- coefficients(model)[indep_vars]
  if (cluster_se) {
    se <- cl(data, model, clust)[indep_vars, 2]
  } else {
    se <- summary(model)$coefficients[indep_vars, 2]
  }
  w <- beta_model / se
  boots <- parallel::mclapply(seq_len(boot_reps), boot, G = G,
    formula = formula, data = data, family = family, beta_model = beta_model,
    cluster_se = cluster_se, indep_vars = indep_vars, k = k,
    clust_list = clust_list, clust_length = clust_length, stratify = stratify,
    nonparametric = nonparametric,
    mc.cores = ifelse(parallel, parallel::detectCores(), 1))
  if (nonparametric) {
    beta_boot <- do.call(rbind, boots)
    beta_boot <- na.omit(beta_boot)
    num_fail <- length(attr(beta_boot, "na.action"))
    ci <- t(apply(beta_boot, 2, quantile, probs = c(.025, .975)))
    p <- apply(beta_boot, 2, function(x) 2 * min(mean(x > 0), mean(x < 0)))
    p <- matrix(p, ncol = 1)
  } else {
    w_store <- do.call(rbind, boots)
    w_store <- na.omit(w_store)
    num_fail <- length(attr(w_store, "na.action"))
    crit <- apply(abs(w_store), 2, quantile, probs = ci_level)
    p_store_s <- t(apply(abs(w_store), 1, function(v) as.numeric(abs(w) > v)))
    ci <- cbind(beta_model - crit * se, beta_model + crit * se)
    p <- matrix(1 - colMeans(p_store_s), ncol = 1)
  }
  if (report) {
    if (nonparametric) {
      cat("\n\n\nResults of nonparametric bootstrap with", boot_reps,
        "replicates.\n")
    } else {
      cat("\n\n\nResults of parametric bootstrap with", boot_reps,
        "replicates.\n")
    }
    print_p <- rbind(c("variable name", "clustered bootstrap p-value"),
      cbind(indep_vars, p))
    print_ci <- rbind(c("variable name", "CI lower", "CI higher"),
      cbind(indep_vars, ci))
    if (num_fail != 0) {
      cat("\n\n\n****Warning: ", num_fail, " out of ", boot_reps,
        "bootstrap replicate models failed to estimate.****\n")
    }
    cat("\nCluster Bootstrap p-values:\n\n")
    printmat(print_p)
    cat("\nConfidence Intervals (derived from bootstrapped t-statistics):\n\n")
    printmat(print_ci)
  }
  dimnames(p) <- list(indep_vars, c("clustered bootstrap p-value"))
  dimnames(ci) <- list(indep_vars, c("CI lower", "CI higher"))
  out <- list(p.values = p, ci = ci, se = se, num_fail = num_fail)
  invisible(out)
}
