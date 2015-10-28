
cv <- "pvot"
ic <- FALSE
pol <- "politics"
fr <- "friend"

cb_pol_08_nov <- estimate(pol, b, at.08, incl_conflict = ic,
  contagion_varnames = cv)
cb_pol_10_nov <- estimate(pol, b, at.10, incl_conflict = ic,
  contagion_varnames = cv)
cb_pol_12_nov <- estimate(pol, b, at.12, incl_conflict = ic,
  contagion_varnames = cv)
cb_pol_14_nov <- estimate(pol, b, at.14, incl_conflict = ic,
  contagion_varnames = cv)
cb_fr_08_nov <- estimate(fr, b, at.08, incl_conflict = ic,
  contagion_varnames = cv)
cb_fr_10_nov <- estimate(fr, b, at.10, incl_conflict = ic,
  contagion_varnames = cv)
cb_fr_12_nov <- estimate(fr, b, at.12, incl_conflict = ic,
  contagion_varnames = cv)
cb_fr_14_nov <- estimate(fr, b, at.14, incl_conflict = ic,
  contagion_varnames = cv)
