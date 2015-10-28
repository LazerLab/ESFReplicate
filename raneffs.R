library(ESFpack)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
load("ESF_Data.RData")

# helper functions
enhance_data <- function(data, net = "politics", contagion_varnames = "mvint",
  conflict_varnames = c("ideomd", "ideosd0", "party.rhhi"),
  tie = "both")
{
  vars <- make_vars(net, tie, contagion_varnames, conflict_varnames)
  cont <- vars$contagion
  conf <- vars$conflict
  if (is.null(cont) | is.null(conf)) {
    stop("Wrong network name.")
  }
  exogs <- c("Female", "Race_white", "Race_black", "Rep",
    "Dem", "Ind", "SchYear", "Ideology", "Ideo_strength",
    "Interest_pol")
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
  vars <- c(cont, conf, exogs)
  data$Party <- data$PolitPref
  data
}

make_stan_data <- function(data)
{
  df <- subset(data, select = c(vote, mvint.pol.both, ideomd.pol.both,
    ideosd0.pol.both, party.rhhi.pol.both,
    vint, Female, Interest_pol, Ideology, Party, Race, SchYear, ChapterN))
  df <- na.omit(df)
  dl <- list(N = nrow(df), vote = df$vote, mvint_pol_both = df$mvint.pol.both,
    ideomd_pol_both = df$ideomd.pol.both,
    ideosd0_pol_both = df$ideosd0.pol.both,
    party_rhhi_pol_both = df$party.rhhi.pol.both,
    vint = df$vint, Female = df$Female, Interest_pol = df$Interest_pol,
    Ideology = df$Ideology, Party = df$Party, Race = df$Race,
    SchYear = df$SchYear, ChapterN = df$ChapterN)
  dl
}

make_stan_code_bits <- function(group) {
  # this function is just useful for quickly writing MLMs in stan
  cat("vector[XXX] a_e_", group, ";\n", sep = "")
  cat("real<lower=0> a_s_", group, ";\n", sep = "")
  cat("vector[XXX] a_", group, ";\n", sep = "")
  cat("a_", group, " <- a_s_", group, " * (a_e_", group, " - mean(a_e_", group,
    "));\n", sep = "")
  cat("a_e_", group, "[", group, "[n]] +\n", sep = "")
  cat("a_e_", group, " ~ normal(0, 1);\n", sep = "")
  cat("a_s_", group, " ~ cauchy(0, 2.5);\n", sep = "")
  cat('"a_e_', group, '", "a_s_', group, '"\n', sep = "")
  invisible()
}

# end helper functions


sm_contagion <- stan_model("ESFcontagion.stan")
sm_conflict <- stan_model("ESFconflict.stan")

# useful for writing stan code quickly
for(group in c("vint", "Interest_pol", "Ideology", "Party", "Race",
  "SchYear", "ChapterN"))
  make_stan_code_bits(group)


# begin analysis
enh.at.08 <- enhance_data(at.08)
enh.at.10 <- enhance_data(at.10)
enh.at.12 <- enhance_data(at.12)
enh.at.14 <- enhance_data(at.14)

pars_to_exclude <- c("linear_predictor",
  "a_e_vint", "a_s_vint",
  "a_e_Interest_pol", "a_s_Interest_pol",
  "a_e_Ideology", "a_s_Ideology",
  "a_e_Party", "a_s_Party",
  "a_e_Race", "a_s_Race",
  "a_e_SchYear", "a_s_SchYear",
  "a_e_ChapterN", "a_s_ChapterN")

sf_contagion_08 <- sampling(sm_contagion, data = make_stan_data(enh.at.08),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 1819549747, thin = 2)
sf_contagion_10 <- sampling(sm_contagion, data = make_stan_data(enh.at.10),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 494228618, thin = 2)
sf_contagion_12 <- sampling(sm_contagion, data = make_stan_data(enh.at.12),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 1794026683, thin = 2)
sf_contagion_14 <- sampling(sm_contagion, data = make_stan_data(enh.at.14),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 630289971, thin = 2, control = list(adapt_delta = .99))

sf_conflict_08 <- sampling(sm_conflict, data = make_stan_data(enh.at.08),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 296610865, thin = 2)
sf_conflict_10 <- sampling(sm_conflict, data = make_stan_data(enh.at.10),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 1522916390, thin = 2)
sf_conflict_12 <- sampling(sm_conflict, data = make_stan_data(enh.at.12),
  warmup = 50, iter = 300, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 267347092, thin = 2)
sf_conflict_14 <- sampling(sm_conflict, data = make_stan_data(enh.at.14),
  warmup = 50, iter = 550, chains = 4, include = FALSE, pars = pars_to_exclude,
  seed = 1910766984, thin = 2, control = list(adapt_delta = .99))

print(sf_contagion_08, "b0")
print(sf_contagion_10, "b0")
print(sf_contagion_12, "b0")
print(sf_contagion_14, "b0")

print(sf_conflict_08, "b0")
print(sf_conflict_10, "b0")
print(sf_conflict_12, "b0")
print(sf_conflict_14, "b0")
