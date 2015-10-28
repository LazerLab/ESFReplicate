#'  \code{format_output}
#'
#'  Format the ouput from one object or a list of objects
#'
#'  @param ... est object(s) to format for output
#'  @param full logical, report extra controls
#'  @param coef_type character, type of coefficients to show (as.is, OR, prob, or
#'      perc.change)
#'
#'  @return character array
#'
#'  @export
#'
format_output <- function(..., full = TRUE, coef_type = "as.is")
{
  options(stringsAsFactors = FALSE)
  object_list <- list(...)
  out <- lapply(object_list, format_object, coef_type = coef_type)
  out <- Reduce(function(...) merge(..., all = TRUE, sort = FALSE), out)
  out[is.na(out)] <- " - "
  out[, -1] <- format(out[, -1], justify = "left")
  cont <- grep("Proportion of|Average", out$Name)
  conf <- grep("divergence|diversity|fragment|HHI", out$Name)
  intn <- grep("Intent", out$Name)
  intc <- grep("Intercept", out$Name) + 0
  if (full) {
    ok1 <- setdiff(seq_len(nrow(out)), c(intc, cont, intn, conf))
    ok2 <- c(intc, cont, intn, conf, ok1)
    out <- out[ok2, ]
  } else {
    out <- out[c(cont, conf),]
  }
  out
}
