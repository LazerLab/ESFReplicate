#'  \code{plot_marginal}
#'
#'  Draw a marginal effects plot
#'
#'  @param meff data.frame of marginal effects
#'
#'  @return object of class ggplot
#'
#'  @import ggplot2
#'
#'  @export
#'
plot_marginal <- function(meff)
{
  if (!is.data.frame(meff)) {
    meff <- do.call(rbind, meff)
  }
  x <- colnames(meff)[1]
  y <- colnames(meff)[2]
  meff$Effects <- paste0(sub(".* of (.*) ties .*", "\\1",
    pretty_var_names(meff$Treat)), " ties - ", meff$Year)
  g <- ggplot2::ggplot(meff,
    ggplot2::aes_string(x, y, group = "Effects", colour = "Effects"))
  g + ggplot2::ggtitle(paste("Voting by tie voting (%) for",
      paste(unique(meff$Year), collapse = ", "))) +
    ggplot2::scale_x_continuous(name = pretty_var_names(meff$Treat[1])) +
    ggplot2::scale_y_continuous(name = "Voting probability") +
    ggplot2::geom_point() +
    ggplot2::geom_line(data = meff) +
    ggplot2::geom_ribbon(data = meff,
      ggplot2::aes(ymin = LB, ymax = UB, fill = Effects),
      alpha = 0.1, linetype = "blank") +
    ggplot2::theme_bw()
}
