#'  \code{peer_calc}
#'
#'  Generate the various conflict & contagion variables
#'
#'  @param varname character, variable name from attrx
#'  @param attrx data.frame of node-levels variables
#'  @param stat "mean" or "div", which peer effects to calculate
#'
#'  @return data.frame, results of a call to either peer_mean or peer_div
#'
#'  @export
#'
peer_calc <- function(varname, attrx, stat = "mean")
{
  stopifnot(stat %in% c("mean", "div"))
  netx <- NULL
  net2 <- NULL
  yy <- substr(attrx$Year[1], 3, 4)
  if (grepl(".fr", varname)) {
    netx <- get(paste0("netf.", yy))
  } else if (grepl(".pol", varname))  {
    netx <- get(paste0("netp.", yy))
  } else if (grepl(".time", varname)) {
    netx <- get(paste0("nett.", yy))
  } else if (grepl(".est", varname))  {
    netx <- get(paste0("nete.", yy))
  } else if (grepl(".aca", varname))  {
    netx <- get(paste0("neta.", yy))
  } else if (grepl(".no", varname))   {
    netx <- get(paste0("netn.", yy))
  } else if (grepl(".fpt", varname))  {
    netx <- get(paste0("netf.", yy)) +
      get(paste0("netp.", yy)) +
      get(paste0("nett.", yy))
  } else {
    stop("wrong var name!")
  }
  if (grepl(".fpte", varname))  {
    netx <- netx + get(paste0("nete.", yy))
  }
  if (grepl(".fr.only.", varname)) {
    net2 <- get(paste0("netp.", yy))
  }
  if (grepl(".pol.only.", varname)) {
    net2 <- get(paste0("netf.", yy))
  }
  if (grepl(".frandpol", varname)) {
    net2 <- get(paste0("netp.", yy))
  }
  if (grepl(".frorpol", varname)) {
    net2 <- get(paste0("netp.", yy))
  }
  if (grepl(".frpol", varname)) {
    net2 <- get(paste0("netp.", yy))
  }
  if (grepl("^pvotS|^mvintS", varname)) {
    netx <- (netx & make_similarity_matrix(attrx$polpr)) + 0
  }
  if (grepl("^pvotD|^mvintD", varname)) {
    netx <- (netx & !(make_similarity_matrix(attrx$polpr))) + 0
  }
  if (grepl(".only", varname)) {
    netx <- (netx & !(net2)) + 0
  }
  if (grepl(".frandpol", varname)) {
    netx <- (netx & net2) + 0
  }
  if (grepl(".frorpol", varname)) {
    netx <- (netx | net2) + 0
  }
  if (grepl("^pvot", varname)) {
    attr.name <- "vote"
  }
  if (grepl("^mvint", varname)) {
    attr.name <- "vint"
  }
  if (grepl("^mpint", varname)) {
    attr.name <- "Interest_pol"
  }
  if (grepl("^ideomd", varname)) {
    attr.name <- "ideomd"
  }
  if (grepl("^ideosd0", varname)) {
    attr.name <- "ideosd0"
  }
  if (grepl("^party.hhi", varname)) {
    attr.name <- "party.hhi"
  }
  if (grepl("^party.rhhi", varname)) {
    attr.name <- "party.rhhi" #1-hhi
  }
  tie <- sub(".*\\.([^\\.]*)$", "\\1", varname)
  if (stat == "mean") {
    peer_mean(netx, attrx, attr.name, tie)
  } else if (stat == "div") {
    peer_div(netx, attrx, attr.name, tie)
  }
}
