#'  \code{boot}
#'
#'  Calculate one clustered bootstrap replicate (for internal use only)
#'
#'  @param i fake argument to pass to mclapply
#'  @param G number of groups/clusters
#'  @param formula model formula
#'  @param data data.fram to use in analysis
#'  @param family character string, which model to use (binomial or gaussian)
#'  @param beta_model numeric vector, estimated coefs from model
#'  @param cluster_se logical, use clustered standard errors?
#'  @param indep_vars character vector of names of independent variables
#'  @param k number of regressors
#'  @param clust_list list of integer vectors with row indices of cluster members
#'  @param clust_length integer vector of num of observations in each cluster
#'  @param stratify logical, further resample within clusters?
#'  @param nonparametric logical, conduct nonparametric bootstrap?
#'
#'  @return numeric vector of estimated coefficients (if nonparametric) or
#'      p-values (if parametric)
#'
#'  @export
#'
boot <- function(i, G, formula, data, family, beta_model, cluster_se,
  indep_vars, k, clust_list, clust_length, stratify, nonparametric)
{
  resample_in_g <- function(g) {
    if (stratify) {
      index <- sample(clust_list[[g]], replace = TRUE)
    } else {
      index <- clust_list[[g]]
    }
    data.frame(index = index, clust = rep(g, clust_length[g]))
  }
  boot_G <- sample.int(G, replace = TRUE)
  boot_df <- do.call(rbind, lapply(boot_G, resample_in_g))
  boot_data <- data[boot_df$index, ]
  boot_model <- suppressWarnings(tryCatch(
    glm(formula, family = family, data = boot_data),
    error = function(x) NA))
  fail <- any(is.na(boot_model))
  if (!fail & !boot_model$converged) {
    boot_model <- NA
  }
  beta_boot <- tryCatch(coefficients(boot_model)[indep_vars],
    error = function(x) NA, warning = function(x) NA)
  if (fail) {
    rep(NA, k)
  } else if (nonparametric) {
    beta_boot
  } else {
    if (cluster_se) {
      summ <- cl(boot_data, boot_model, boot_df$clust)
    } else {
      summ <- summary(boot_model)$coefficients
    }
    se_boot <- tryCatch(summ[indep_vars, 2],
      error = function(x) NA, warning = function(x) NA)
    (beta_boot - beta_model) / se_boot
  }
}
