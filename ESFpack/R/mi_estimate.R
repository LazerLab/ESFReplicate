#'  \code{mi_estimate}
#'
#'  Do multiple imputation and estimation
#'
#'  @param net character, name of network type
#'  @param m integer number of imputations to perform
#'  @param data data.frame to use in model
#'  @param nom character vector of names of variables with nominal data
#'  @param ord character vector of names of variables with ordered data
#'  @param incl_imputations logical, store imputations?
#'  @param contagion_varnames character vector of contagion variable names
#'  @param conflict_varnames character vector of conflict variable names
#'  @param incl_contagion logical, whether to include contagion analysis
#'  @param incl_conflict logical, whether to include conflict analysis
#'  @param incl_vote_intent logical, whether to include voting intent
#'  @param fast logical, TODO fill this out
#'  @param tie characater, argument to pass to make_vars, which tie type to use
#'      (both, in, or out)
#'  @param model character, link function name (logit or gaussian)
#'  @param subs vector describing how to subset, either NA for no subsetting or
#'      a pair of values, one with column name to subset by and a second with
#'      value to subset with
#'  @param incl_chapter_FEs logical, include chapter fixed effects?
#'  @param parallel logical, use multiple cores? overridden if m <= 10
#'
#'  @import mice
#'
#'  @return object of class miest
#'
#'  @export
#'
mi_estimate <- function(net, m = 10L, data = NULL,
  nom = c("Female", "Race_white", "Race_black", "Rep", "Dem", "Ind"),
  ord = c("SchYear", "Ideology", "Ideo_strength", "Interest_pol"),
  incl_imputations = FALSE, contagion_varnames = "mvint",
  conflict_varnames = c("ideomd", "ideosd0", "party.rhhi"),
  incl_contagion = TRUE, incl_conflict = FALSE,
  incl_vote_intent = TRUE, fast = FALSE, tie = "both", model = "logit",
  subs = NA, incl_chapter_FEs = FALSE, parallel = TRUE)
{
  if (m <= 1000) {
    parallel <- FALSE
  }
  response <- "vote"
  oth <- c("ChapterN", "ID", "Year", "polpr", "Chapter", "NewScholar")
  if (incl_vote_intent) {
    ord <- c("vint", ord)
  }
  stopifnot(!missing(data))
  call <- match.call()
  cat("Running ", paste(deparse(call), sep = "\n", collapse = "\n"),
    "\n", sep = "")
  data[, nom] <- apply(data[, nom], 2, as.factor)
  vars <- make_vars(net, tie = tie, contagion_varnames, conflict_varnames)
  cont <- vars$contagion
  conf <- vars$conflict
  if (is.null(cont) | is.null(conf)) {
    stop("Wrong network name.")
  }
  cont_to_calc <- !sapply(cont, function(x) x %in% colnames(data))
  conf_to_calc <- !sapply(conf, function(x) x %in% colnames(data))
  if (any(cont_to_calc)) {
    INDEX <- cont[cont_to_calc]
    x <- sapply(INDEX, peer_calc, attrx = data, stat = "mean")
    data[, INDEX] <- as.data.frame(x)
  }
  if (any(conf_to_calc)) {
    INDEX <- conf[conf_to_calc]
    x <- sapply(INDEX, peer_calc, attrx = data, stat = "div")
    data[, INDEX] <- as.data.frame(x)
  }
  data <- data[, c(oth, response, cont, conf, nom, ord)]
  data$const <- 1
  vint <- grepl("^vint$", colnames(data))
  mvint <- grepl("^mvint", colnames(data))
  exclude <- grepl("^vint|^mvint|^pvot|^Chapter|^ID$|^Year$", colnames(data))
  cont_in_data <- sapply(cont, grepl, x = colnames(data))
  ct <- apply(cont_in_data, 1, any)
  res <- grepl(response, colnames(data))
  if (any(vint) & !fast) {
    data[, vint][data[, vint] == 0] <- NA
  }
  if (any(ct) & !fast) {
    data[, ct] <- NA
  }
  predictorMatrix <- matrix(1, ncol(data), ncol(data),
    dimnames = list(colnames(data), colnames(data)))
  predictorMatrix[, response] <- 0
  predictorMatrix[, exclude] <- 0
  predictorMatrix[, conf] <- 0
  predictorMatrix[, cont] <- 0
  predictorMatrix[, "ChapterN"] <- -2
  method <- rep("", ncol(data))
  ok <- apply(data, 2, function(x) any(is.na(x)))
  method[ok] <- "pmm"
  method[colnames(data) %in% nom] <- "polyreg"
  method[vint] <- "2l.norm"
  method[colnames(data) == "Ideo_strength"] <- paste0("~ I(abs(Ideology - 4))")
  if (!fast) {
    method[ct] <- paste0("~ I(peer_calc(varname = '", cont, "', ",
      "attrx = data.frame(vint = vint, Year = Year, ID = ID, polpr = polpr)))")
  }
  if (parallel) {
    mc.cores <- parallel::detectCores()
    if (m %% mc.cores == 0) {
      ms <- rep(floor(m / mc.cores), mc.cores)
    } else {
      ms <- c(rep(floor(m / mc.cores), mc.cores - 1), m %% mc.cores)
    }
    imp_list <- parallel::mclapply(ms, function(mm)
      mice::mice(data = data, m = mm, maxit = 5, method = method,
        predictorMatrix = predictorMatrix, printFlag = FALSE),
      mc.cores = mc.cores)
    imp <- merge_mice(imp_list)
  } else {
    imp <- mice::mice(data = data, m = m, maxit = 5, method = method,
      predictorMatrix = predictorMatrix, printFlag = FALSE)
  }
  f1 <- paste0(response, " ~ ")
  if (incl_contagion) {
    f1 <- paste0(f1,  paste(cont, collapse = " + "))
  }
  f1 <- paste0(f1, " + ", paste(nom, collapse = " + "), " + ",
    paste(ord, collapse = " + ") )
  if (incl_conflict) {
    f1 <- paste0(f1,  " + ", paste(conf, collapse = " + "))
  }
  if (incl_conflict) {
    f1 <- paste0(f1,  " + ", paste(conf, collapse = " + "))
  }
  if (incl_chapter_FEs) {
    f1 <- paste(f1, "+ factor(ChapterN)",  sep = "")
  }
  expr_lg <- "glm(as.formula(f1), family = binomial)"
  expr_lm <- "lm(as.formula(f1))"
  if (!is.na(subs[1])) {
    expr_lg <- sub("))", "), subset = (get(subs[1]) == subs[2]))", expr_lg)
    expr_lm <- sub("))", "), subset = (get(subs[1]) == subs[2]))", expr_lm)
  }
  expr <- ifelse(model == "logit", expr_lg, expr_lm)
  mi_mod <- with(data = imp, parse(text = expr))
  pooled_mi <- mice::pool(mi_mod)
  # round(mice::summary(pooled_mi), 2) # print to screen?
  year <- unique(c(data$Year, data$year))
  N <- nrow(data)
  out <- list(treat = c(cont), pooled_mi = pooled_mi, mi_mod = mi_mod, m = m,
    N = N, net = net, year = year)
  if (model != "logit")  {
    out$R2 <- pool_r2(mi_mod)
  }
  if (incl_imputations) {
    out$imp <- imp
  }
  class(out) <- c("miest", "est")
  out
}
