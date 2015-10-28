
cb_pol_08 <- estimate("politics", b, at.08, incl_conflict = FALSE)
cb_pol_10 <- estimate("politics", b, at.10, incl_conflict = FALSE)
cb_pol_12 <- estimate("politics", b, at.12, incl_conflict = FALSE)
cb_pol_14 <- estimate("politics", b, at.14, incl_conflict = FALSE)

cb_fr_08 <- estimate("friend", b, at.08, incl_conflict = FALSE)
cb_fr_10 <- estimate("friend", b, at.10, incl_conflict = FALSE)
cb_fr_12 <- estimate("friend", b, at.12, incl_conflict = FALSE)
cb_fr_14 <- estimate("friend", b, at.14, incl_conflict = FALSE)

cb_time_08 <- estimate("time", b, at.08, incl_conflict = FALSE)
cb_time_10 <- estimate("time", b, at.10, incl_conflict = FALSE)
cb_time_12 <- estimate("time", b, at.12, incl_conflict = FALSE)
cb_time_14 <- estimate("time", b, at.14, incl_conflict = FALSE)

cb_est_08 <- estimate("esteem", b, at.08, incl_conflict = FALSE)
cb_est_10 <- estimate("esteem", b, at.10, incl_conflict = FALSE)
cb_est_12 <- estimate("esteem", b, at.12, incl_conflict = FALSE)
cb_est_14 <- estimate("esteem", b, at.14, incl_conflict = FALSE)

cb_no_08 <- estimate("dislike", b, at.08, incl_conflict = FALSE)
cb_no_10 <- estimate("dislike", b, at.10, incl_conflict = FALSE)
cb_no_12 <- estimate("dislike", b, at.12, incl_conflict = FALSE)
cb_no_14 <- estimate("dislike", b, at.14, incl_conflict = FALSE)

cb_aca_12 <- estimate("academic", b, at.12, incl_conflict = FALSE)
cb_aca_14 <- estimate("academic", b, at.14, incl_conflict = FALSE)


format_output(cb_pol_08, cb_pol_10, cb_pol_12, cb_pol_14, coef_type="OR")


