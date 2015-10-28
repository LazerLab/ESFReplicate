

#---------------------LIKELY/UNLIKELY VOTER MODELS-----------------------------#
subs <- c("l.vot", TRUE)
cb_pol_08_lv <- estimate("politics", b, at.08,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_10_lv <- estimate("politics", b, at.10,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_12_lv <- estimate("politics", b, at.12,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_14_lv <- estimate("politics", b, at.14,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_08_lv <- estimate("friend", b, at.08,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_10_lv <- estimate("friend", b, at.10,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_12_lv <- estimate("friend", b, at.12,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_14_lv <- estimate("friend", b, at.14,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)

subs <- c("u.vot", FALSE)
cb_pol_08_uv <- estimate("politics", b, at.08,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_10_uv <- estimate("politics", b, at.10,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_12_uv <- estimate("politics", b, at.12,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_pol_14_uv <- estimate("politics", b, at.14,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_08_uv <- estimate("friend", b, at.08,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_10_uv <- estimate("friend", b, at.10,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_12_uv <- estimate("friend", b, at.12,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
cb_fr_14_uv <- estimate("friend", b, at.14,
  incl_conflict = FALSE, subs = subs, incl_vote_intent = FALSE)
