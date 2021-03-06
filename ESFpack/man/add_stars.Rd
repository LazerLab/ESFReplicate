% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/add_stars.R
\name{add_stars}
\alias{add_stars}
\title{\code{add_stars}}
\usage{
add_stars(p = NULL, t = NULL, df = NULL)
}
\arguments{
\item{p}{numeric, p values}

\item{t}{numeric, t values}

\item{df}{integer, degrees of freedom}
}
\value{
character string, with significance codes "***" = 0.001,
   "**" = 0.01, "*" = 0.05, "." =  0.1
}
\description{
add stars to coefficients
}
\examples{
add_stars(seq(0, .2, .01))
}

