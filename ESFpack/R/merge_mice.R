#'  \code{merge_mice}
#'
#'  taken from http://stackoverflow.com/questions/24040280,
#'  (with) minor bug fixes
#'
#'  @param imp list of mids objects
#'
#'  @return mids object
#'
#'  @import abind
#'
#'  @export
#'
merge_mice <- function (imp)
{
  merged_imp <- NULL
  for (n in seq_len(length(imp))) {
    if (is.null(merged_imp)){
      merged_imp <- imp[[n]]
    } else {
      counter <- merged_imp$m
      merged_imp$m <- merged_imp$m + imp[[n]]$m
      dimnames(imp[[n]]$chainMean)[[3]] <-
        sprintf("Chain %d", (counter + 1):merged_imp$m)
      dimnames(imp[[n]]$chainVar)[[3]] <-
        sprintf("Chain %d", (counter + 1):merged_imp$m)
      merged_imp$chainMean <- abind::abind(merged_imp$chainMean,
        imp[[n]]$chainMean)
      merged_imp$chainVar <- abind::abind(merged_imp$chainVar,
        imp[[n]]$chainVar)
      for (nn in names(merged_imp$imp)) {
        if (!is.null(imp[[n]]$imp[[nn]])) {
          colnames(imp[[n]]$imp[[nn]]) <- (counter + 1):merged_imp$m
          merged_imp$imp[[nn]] <- cbind(merged_imp$imp[[nn]],
            imp[[n]]$imp[[nn]])
        }
      }
    }
  }
  merged_imp
}
