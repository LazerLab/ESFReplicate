exogs <- c("vint.rec", "vint.miss", "Female", "Race_white", "Race_black", "Rep",
  "Dem", "Ind", "SchYear",  "Ideology", "Ideo_strength", "Interest_pol")
cb_pol_08_miss <- estimate("politics", b, at.08, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_pol_10_miss <- estimate("politics", b, at.10, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_pol_12_miss <- estimate("politics", b, at.12, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_pol_14_miss <- estimate("politics", b, at.14, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_fr_08_miss <- estimate("friend", b, at.08, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_fr_10_miss <- estimate("friend", b, at.10, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_fr_12_miss <- estimate("friend", b, at.12, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_fr_14_miss <- estimate("friend", b, at.14, incl_vote_intent = FALSE,
  incl_conflict = FALSE, exogs = exogs)
cb_pol_08_miss_cdiv <- estimate("politics", b, at.08, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_pol_10_miss_cdiv <- estimate("politics", b, at.10, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_pol_12_miss_cdiv <- estimate("politics", b, at.12, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_pol_14_miss_cdiv <- estimate("politics", b, at.14, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_fr_08_miss_cdiv <- estimate("friend", b, at.08, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_fr_10_miss_cdiv <- estimate("friend", b, at.10, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_fr_12_miss_cdiv <- estimate("friend", b, at.12, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_fr_14_miss_cdiv <- estimate("friend", b, at.14, incl_vote_intent = FALSE,
  incl_conflict = TRUE, exogs = exogs)
cb_pol_08_miss_div <- estimate("politics", b, at.08, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_pol_10_miss_div <- estimate("politics", b, at.10, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_pol_12_miss_div <- estimate("politics", b, at.12, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_pol_14_miss_div <- estimate("politics", b, at.14, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_fr_08_miss_div <- estimate("friend", b, at.08, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_fr_10_miss_div <- estimate("friend", b, at.10, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_fr_12_miss_div <- estimate("friend", b, at.12, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)
cb_fr_14_miss_div <- estimate("friend", b, at.14, incl_vote_intent = FALSE,
  incl_contagion = FALSE, incl_conflict = TRUE, exogs = exogs)

