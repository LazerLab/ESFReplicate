#===================PCA DIVERSITY MODELS=======================================#

dv <- make_vars("politics")$conflict

dv.08 <- as.data.frame(sapply(dv, peer_calc, attrx = at.08, stat = "div"))
dv.10 <- as.data.frame(sapply(dv, peer_calc, attrx = at.10, stat = "div"))
dv.12 <- as.data.frame(sapply(dv, peer_calc, attrx = at.12, stat = "div"))
dv.14 <- as.data.frame(sapply(dv, peer_calc, attrx = at.14, stat = "div"))

fit.pc.08 <- princomp(na.omit(dv.08))
fit.pc.10 <- princomp(na.omit(dv.10))
fit.pc.12 <- princomp(na.omit(dv.12))
fit.pc.14 <- princomp(na.omit(dv.14))

# summary(fit.pc.08)
# plot(fit.pc.08,type = "lines")
# summary(fit.pc.10)
# plot(fit.pc.10,type = "lines")
# summary(fit.pc.12)
# plot(fit.pc.12,type = "lines")
# summary(fit.pc.14)
# plot(fit.pc.14,type = "lines")
# loadings(fit.pc.08)[]
# loadings(fit.pc.10)[]
# loadings(fit.pc.12)[]
# loadings(fit.pc.14)[]

dv.pca <- data.frame(
  pca08 = loadings(fit.pc.08)[, 1],
  pca10 = loadings(fit.pc.10)[, 1],
  pca12 = loadings(fit.pc.12)[, 1],
  pca14 = loadings(fit.pc.14)[, 1])
comp <- function(dvy, i) {
  dvy[, 1] * dv.pca[1, i] + dvy[, 2] * dv.pca[2, i] + dvy[, 3] * dv.pca[3, i]
}
at.08$div.comp.pol.both <- comp(dv.08, 1)
at.10$div.comp.pol.both <- comp(dv.10, 2)
at.12$div.comp.pol.both <- comp(dv.12, 3)
at.14$div.comp.pol.both <- comp(dv.14, 4)

#===================MISSING DATA===============================================#

# Include missingness in covariates as a level of the covariate

at.08$vint.miss <- is.na(at.08$vint)*1
at.10$vint.miss <- is.na(at.10$vint)*1
at.12$vint.miss <- is.na(at.12$vint)*1
at.14$vint.miss <- is.na(at.14$vint)*1

at.08$vint.rec <- at.08$vint
at.10$vint.rec <- at.10$vint
at.12$vint.rec <- at.12$vint
at.14$vint.rec <- at.14$vint

at.08$vint.rec[is.na(at.08$vint.rec)] <-  0
at.10$vint.rec[is.na(at.10$vint.rec)] <-  0
at.12$vint.rec[is.na(at.12$vint.rec)] <-  0
at.14$vint.rec[is.na(at.14$vint.rec)] <-  0

# at.08$vint <- at.08$vint.rec
# at.10$vint <- at.10$vint.rec
# at.12$vint <- at.12$vint.rec
# at.14$vint <- at.14$vint.rec
#
at.08$l.vot <- at.08$vint %in% c(4,5)
at.10$l.vot <- at.10$vint %in% c(4,5)
at.12$l.vot <- at.12$vint %in% c(4,5)
at.14$l.vot <- at.14$vint %in% c(4,5)

at.08$u.vot <- at.08$vint %in% c(1,2)
at.10$u.vot <- at.10$vint %in% c(1,2)
at.12$u.vot <- at.12$vint %in% c(1,2)
at.14$u.vot <- at.14$vint %in% c(1,2)
