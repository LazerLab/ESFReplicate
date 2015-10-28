
nom <- c("Female",  "Rep", "Dem", "Race_white")
ord <- c("Ideology", "Ideo_strength", "Interest_pol")
exogs <- c("Female", "Rep", "Dem", "Ideology", "Ideo_strength", "Interest_pol")
subs <- c("NewScholar", 1)

cb_pol_08_ns <- estimate("politics", b, at.08,
  incl_conflict = FALSE, exogs = exogs, subs = subs, incl_vote_intent = TRUE)
cb_pol_10_ns <- estimate("politics", b, at.10,
  incl_conflict = FALSE, exogs = exogs, subs = subs, incl_vote_intent = TRUE)
cb_pol_12_ns <- estimate("politics", b, at.12,
  incl_conflict = FALSE, exogs = exogs, subs = subs, incl_vote_intent = TRUE)
cb_pol_14_ns <- estimate("politics", b, at.14,
  incl_conflict = FALSE, exogs = exogs, subs = subs, incl_vote_intent = TRUE)
cb_fr_08_ns <- estimate("friend", b, at.08,
  incl_conflict = FALSE, exogs = exogs, subs = subs)
cb_fr_10_ns <- estimate("friend", b, at.10,
  incl_conflict = FALSE, exogs = exogs, subs = subs)
cb_fr_12_ns <- estimate("friend", b, at.12,
  incl_conflict = FALSE, exogs = exogs, subs = subs)
cb_fr_14_ns <- estimate("friend", b, at.14,
  incl_conflict = FALSE, exogs = exogs, subs = subs)

mi_pol_08_ns <- mi_estimate("politics", m, at.08, incl_conflict = FALSE,
  nom = nom, ord = ord, subs = subs, incl_vote_intent = TRUE)
mi_pol_10_ns <- mi_estimate("politics", m, at.10, incl_conflict = FALSE,
  nom = nom, ord = ord, subs = subs, incl_vote_intent = TRUE)
mi_pol_12_ns <- mi_estimate("politics", m, at.12, incl_conflict = FALSE,
  nom = nom, ord = ord, subs = subs, incl_vote_intent = TRUE)
mi_pol_14_ns <- mi_estimate("politics", m, at.14, incl_conflict = FALSE,
  nom = nom, ord = ord, subs = subs, incl_vote_intent = TRUE)

mi_fr_08_ns <- mi_estimate("friend", m, at.08, incl_conflict = FALSE)
mi_fr_10_ns <- mi_estimate("friend", m, at.10, incl_conflict = FALSE)
mi_fr_12_ns <- mi_estimate("friend", m, at.12, incl_conflict = FALSE)
mi_fr_14_ns <- mi_estimate("friend", m, at.14, incl_conflict = FALSE)
