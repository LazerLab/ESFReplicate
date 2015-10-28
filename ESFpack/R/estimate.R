#'  \code{estimate}
#'
#'  Estimate peer effects model
#'
#'  @param net character, name of network type
#'  @param boot_reps integer, number of bootstrap replicates
#'  @param data data.frame to use in model
#'  @param exogs character vector of exogenous variable names to include in model
#'  @param incl_contagion logical, whether to include contagion analysis
#'  @param incl_conflict logical, whether to include conflict analysis
#'  @param incl_vote_intent logical, whether to include voting intent
#'  @param contagion_varnames character vector of contagion variable names
#'  @param conflict_varnames character vector of conflict variable names
#'  @param tie characater, argument to pass to make_vars, which tie type to use
#'      (both, in, or out)
#'  @param model character, link function name (logit or gaussian)
#'  @param subs vector describing how to subset, either NA for no subsetting or
#'      a pair of values, one with column name to subset by and a second with
#'      value to subset with
#'  @param parallel logical, use multiple cores? overridden if b < 100
#'  @param incl_chapter_FEs logical, include chapter fixed effects?
#'
#'  @return object of classes cblest and est
#'
#'  @export
#'
estimate <- function(net, boot_reps = 10, data = NULL, exogs = NULL,
  incl_contagion = TRUE, incl_conflict = TRUE, incl_vote_intent = TRUE,
  contagion_varnames = "mvint",
  conflict_varnames = c("ideomd", "ideosd0", "party.rhhi" ), tie = "both",
  model = "logit", subs = NA, parallel = FALSE, incl_chapter_FEs = FALSE)
{
  if (boot_reps < 100) {
    parallel <- FALSE
  }
  stopifnot(!missing(data))
  vars <- make_vars(net, tie, contagion_varnames, conflict_varnames)
  cont <- vars$contagion
  conf <- vars$conflict
  if (is.null(cont) | is.null(conf)) {
    stop("Wrong network name.")
  }
  call <- match.call()
  cat("Running ", paste(deparse(call), sep = "\n", collapse = "\n"),
    "\n", sep = "")
  response <- "vote"
  if (is.null(exogs) || (exogs[1] == "all.controls")) {
    exogs <- c("Female", "Race_white", "Race_black", "Rep", "Dem", "Ind",
      "SchYear", "Ideology", "Ideo_strength", "Interest_pol")
  }
  if (incl_vote_intent) {
    exogs <- c("vint", exogs)
  }
  cont_to_calc <- !sapply(cont, function(x) x %in% colnames(data))
  conf_to_calc <- !sapply(conf, function(x) x %in% colnames(data))
  if (any(cont_to_calc)) {
    idx <- cont[cont_to_calc]
    x <- sapply(idx, peer_calc, attrx = data, stat = "mean")
    data[, idx] <- as.data.frame(x)
  }
  if (any(conf_to_calc)) {
    idx <- conf[conf_to_calc]
    x <- sapply(idx, peer_calc, attrx = data, stat = "div")
    data[, idx] <- as.data.frame(x)
  }
  if (!is.na(subs[1])) {
    data <- subset(data, get(subs[1]) == subs[2])
  }
  f1 <- paste(response, " ~ ")
  if (incl_contagion) {
    f1 <- paste(f1, paste(cont, collapse = " + "), " + ")
  }
  f1 <- paste(f1, paste(exogs, collapse = " + "),  sep = "")
  if (incl_conflict) {
    f1 <- paste0(f1, " + ",  paste(conf, collapse = " + "))
  }
  if (incl_chapter_FEs) {
    f1 <- paste(f1, "+ factor(ChapterN)",  sep = "")
  }
  f1 <- as.formula(f1)
  if (model == "logit") {
    fitted_model <- glm(f1, data = data, family = binomial)
  } else if (model == "ols") {
    fitted_model <- glm(f1, data = data, family = gaussian)
  }
  fitted_model$n <- dim(fitted_model$model)[1]
  year <- unique(c(data$Year, data$year))
  bootse <- tryCatch(
    cluster_bs(fitted_model, data, ~ Chapter, 0.95, boot_reps, report = FALSE,
      parallel = parallel),
    error = function(e) {
      print(paste("ERROR:", e))
      NA
    })
  out <- list(cont = cont, conf = conf, fitted_model = fitted_model,
    bootse = bootse, net = net, year = year, boot_reps = boot_reps,
    varn = length(coef(fitted_model)), model = model)
  class(out) <- c("cblest", "est")
  out
}
