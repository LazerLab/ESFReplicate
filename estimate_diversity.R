
#---------------------SINGLE VAR DIVERSITY MODELS------------------------------#

cb_pol_08_div1 <- estimate("politics", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideomd")
cb_pol_10_div1 <- estimate("politics", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideomd")
cb_pol_12_div1 <- estimate("politics", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideomd")
cb_pol_14_div1 <- estimate("politics", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideomd")
cb_pol_08_div2 <- estimate("politics", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideosd0")
cb_pol_10_div2 <- estimate("politics", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideosd0")
cb_pol_12_div2 <- estimate("politics", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideosd0")
cb_pol_14_div2 <- estimate("politics", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "ideosd0")
cb_pol_08_div3 <- estimate("politics", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "party.rhhi")
cb_pol_10_div3 <- estimate("politics", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "party.rhhi")
cb_pol_12_div3 <- estimate("politics", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "party.rhhi")
cb_pol_14_div3 <- estimate("politics", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "party.rhhi")
cb_pol_08_div_c1 <- estimate("politics", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "div.comp")
cb_pol_10_div_c1 <- estimate("politics", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "div.comp")
cb_pol_12_div_c1 <- estimate("politics", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "div.comp")
cb_pol_14_div_c1 <- estimate("politics", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE, conflict_varnames = "div.comp")
cb_pol_08_div <- estimate("politics", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_pol_10_div <- estimate("politics", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_pol_12_div <- estimate("politics", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_pol_14_div <- estimate("politics", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_fr_08_div <- estimate("friend", b, at.08,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_fr_10_div <- estimate("friend", b, at.10,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_fr_12_div <- estimate("friend", b, at.12,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_fr_14_div <- estimate("friend", b, at.14,
  incl_contagion = FALSE, incl_conflict = TRUE)
cb_pol_08_cdiv <- estimate("politics", b, at.08, incl_conflict = TRUE)
cb_pol_10_cdiv <- estimate("politics", b, at.10, incl_conflict = TRUE)
cb_pol_12_cdiv <- estimate("politics", b, at.12, incl_conflict = TRUE)
cb_pol_14_cdiv <- estimate("politics", b, at.14, incl_conflict = TRUE)
cb_fr_08_cdiv <- estimate("friend", b, at.08, incl_conflict = TRUE)
cb_fr_10_cdiv <- estimate("friend", b, at.10, incl_conflict = TRUE)
cb_fr_12_cdiv <- estimate("friend", b, at.12, incl_conflict = TRUE)
cb_fr_14_cdiv <- estimate("friend", b, at.14, incl_conflict = TRUE)
