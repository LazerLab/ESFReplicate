

res_conf <- list()
res_cont <- list()

for (i in 1:14) {
  subs <- c("keep", TRUE)
  ch_keep <- function(x, i) {x$keep <- x$ChapterN %in% setdiff(1:14,i); x}
  res_cont$y08[[i]] <- estimate("politics", b, ch_keep(at.08,i), incl_conflict = FALSE, subs = subs)
  res_cont$y10[[i]] <- estimate("politics", b, ch_keep(at.10,i), incl_conflict = FALSE, subs = subs)
  res_cont$y12[[i]] <- estimate("politics", b, ch_keep(at.12,i), incl_conflict = FALSE, subs = subs)
  res_cont$y14[[i]] <- estimate("politics", b, ch_keep(at.14,i), incl_conflict = FALSE, subs = subs)
  res_conf$y08[[i]] <- estimate("politics", b, ch_keep(at.08,i), incl_conflict = TRUE, subs = subs)
  res_conf$y10[[i]] <- estimate("politics", b, ch_keep(at.10,i), incl_conflict = TRUE, subs = subs)
  res_conf$y12[[i]] <- estimate("politics", b, ch_keep(at.12,i), incl_conflict = TRUE, subs = subs)
  res_conf$y14[[i]] <- estimate("politics", b, ch_keep(at.14,i), incl_conflict = TRUE, subs = subs)
}

save(res_conf, file="LeaveOneOut_Conf.rda")
save(res_cont, file="LeaveOneOut_Cont.rda")

examine_res <- function(l, full=F, line=3) {
  out <- lapply(l, format_object)
  out <- suppressWarnings(Reduce(function(...)merge(..., by="Name"), out))
  if (!full) out <- out[line,]
  names(out)[2:15] <- 1:14
  t(out)}

examine_res(res_conf$y08)
examine_res(res_conf$y10)
examine_res(res_conf$y12)
examine_res(res_conf$y14)

examine_res(res_cont$y08)
examine_res(res_cont$y10)
examine_res(res_cont$y12)
examine_res(res_cont$y14)









