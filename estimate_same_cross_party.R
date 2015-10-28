#### --------- SAME- CROSS- PARTY MODELS --------- ####

cb_pol_08_sp <- estimate("same party politics", b, at.08, incl_conflict = FALSE)
cb_pol_10_sp <- estimate("same party politics", b, at.10, incl_conflict = FALSE)
cb_pol_12_sp <- estimate("same party politics", b, at.12, incl_conflict = FALSE)
cb_pol_14_sp <- estimate("same party politics", b, at.14, incl_conflict = FALSE)
cb_fr_08_sp <- estimate("same party friend", b, at.08, incl_conflict = FALSE)
cb_fr_10_sp <- estimate("same party friend", b, at.10, incl_conflict = FALSE)
cb_fr_12_sp <- estimate("same party friend", b, at.12, incl_conflict = FALSE)
cb_fr_14_sp <- estimate("same party friend", b, at.14, incl_conflict = FALSE)

cb_pol_08_cp <- estimate("cross party politics", b, at.08,
  incl_conflict = FALSE)
cb_pol_10_cp <- estimate("cross party politics", b, at.10,
  incl_conflict = FALSE)
cb_pol_12_cp <- estimate("cross party politics", b, at.12,
  incl_conflict = FALSE)
cb_pol_14_cp <- estimate("cross party politics", b, at.14,
  incl_conflict = FALSE)

cb_fr_08_cp <- estimate("cross party friend", b, at.08, incl_conflict = FALSE)
cb_fr_10_cp <- estimate("cross party friend", b, at.10, incl_conflict = FALSE)
cb_fr_12_cp <- estimate("cross party friend", b, at.12, incl_conflict = FALSE)
cb_fr_14_cp <- estimate("cross party friend", b, at.14, incl_conflict = FALSE)

