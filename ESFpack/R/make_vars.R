#'  \code{make_vars}
#'
#'  Generates the contagion and conflict peer variables (for internal use)
#'
#'  @param net character vector, type of network
#'  @param tie character, type of tie (both, in, out)
#'  @param contagion_varnames character vector of variables for peer effects
#'  @param conflict_varnames character vector of variables for peer effects
#'
#'  @return list of contagion and conflict variables
#'
#'  @export
#'
make_vars <- function(net, tie = "both", contagion_varnames = "mvint",
  conflict_varnames = c("ideomd", "ideosd0", "party.rhhi"))
{
  contagion <- NULL
  conflict <- NULL
  if ("friend" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".fr.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".fr.", tie))
  }
  if ("politics" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".pol.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".pol.", tie))
  }
  if ("time" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".time.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".time.", tie))
  }
  if ("esteem" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".est.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".est.", tie))
  }
  if ("dislike" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".no.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".no.", tie))
  }
  if ("academic" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".aca.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".aca.", tie))
  }
  if ("friend and politics" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".frandpol.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".frandpol.", tie))
  }
  if ("friend not politics" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".fr.only.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".fr.only.", tie))
  }
  if ("politics not friend" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".pol.only.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".pol.only.", tie))
  }
  if ("same party friend" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, "S.fr.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, "S.fr.", tie))
  }
  if ("cross party friend" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, "D.fr.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, "D.fr.", tie))
  }
  if ("same party politics" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, "S.pol.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, "S.pol.", tie))
  }
  if ("cross party politics" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, "D.pol.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, "D.pol.", tie))
  }
  if ("friend-august" %in% net) {
    contagion <-  c(conflict, paste0(conflict_varnames, ".fr.", tie))
  }
  if ("politics-august" %in% net) {
    contagion <-  c(conflict, paste0(conflict_varnames, ".pol.", tie))
  }
  if ("esteem-august" %in% net) {
    contagion <-  c(conflict, paste0(conflict_varnames, ".est.", tie))
  }
  if ("time-august" %in% net) {
    contagion <-  c(conflict, paste0(conflict_varnames, ".time.", tie))
  }
  if ("fpte" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".fpte.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".fpte.", tie))
  }
  if ("fpt" %in% net) {
    contagion <- c(contagion, paste0(contagion_varnames, ".fpt.", tie))
    conflict <- c(conflict, paste0(conflict_varnames, ".fpt.", tie))
  }
  list(contagion = contagion, conflict = conflict)
}
