mi_pol_08 <- mi_estimate("politics", m, at.08, incl_conflict = FALSE)
mi_pol_10 <- mi_estimate("politics", m, at.10, incl_conflict = FALSE)
mi_pol_12 <- mi_estimate("politics", m, at.12, incl_conflict = FALSE)
mi_pol_14 <- mi_estimate("politics", m, at.14, incl_conflict = FALSE)
mi_fr_08 <- mi_estimate("friend", m, at.08, incl_conflict = FALSE)
mi_fr_10 <- mi_estimate("friend", m, at.10, incl_conflict = FALSE)
mi_fr_12 <- mi_estimate("friend", m, at.12, incl_conflict = FALSE)
mi_fr_14 <- mi_estimate("friend", m, at.14, incl_conflict = FALSE)
mi_pol_08_cdiv <- mi_estimate("politics", m, at.08, incl_conflict = TRUE)
mi_pol_10_cdiv <- mi_estimate("politics", m, at.10, incl_conflict = TRUE)
mi_pol_12_cdiv <- mi_estimate("politics", m, at.12, incl_conflict = TRUE)
mi_pol_14_cdiv <- mi_estimate("politics", m, at.14, incl_conflict = TRUE)
mi_fr_08_cdiv <- mi_estimate("friend", m, at.08, incl_conflict = TRUE)
mi_fr_10_cdiv <- mi_estimate("friend", m, at.10, incl_conflict = TRUE)
mi_fr_12_cdiv <- mi_estimate("friend", m, at.12, incl_conflict = TRUE)
mi_fr_14_cdiv <- mi_estimate("friend", m, at.14, incl_conflict = TRUE)
mi_pol_08_div <- mi_estimate("politics", m, at.08, incl_contagion = FALSE,
  incl_conflict = TRUE)
mi_pol_10_div <- mi_estimate("politics", m, at.10, incl_contagion = FALSE,
  incl_conflict = TRUE)
mi_pol_12_div <- mi_estimate("politics", m, at.12, incl_contagion = FALSE,
  incl_conflict = TRUE)
mi_pol_14_div <- mi_estimate("politics", m, at.14, incl_contagion = FALSE,
  incl_conflict = TRUE)
mi_pol_08_nov <- mi_estimate("politics", m, at.08, incl_conflict = FALSE,
  contagion_varnames = "pvot", fast = TRUE)
mi_pol_10_nov <- mi_estimate("politics", m, at.10, incl_conflict = FALSE,
  contagion_varnames = "pvot", fast = TRUE)
mi_pol_12_nov <- mi_estimate("politics", m, at.12, incl_conflict = FALSE,
  contagion_varnames = "pvot", fast = TRUE)
mi_pol_14_nov <- mi_estimate("politics", m, at.14, incl_conflict = FALSE,
  contagion_varnames = "pvot", fast = TRUE)
