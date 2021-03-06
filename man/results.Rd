% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/results.R
\name{results}
\alias{results}
\title{This function gets the results of the analysis and writes them to a file}
\usage{
results(normfit)
}
\arguments{
\item{normfit}{Model of your data fit to a linear model}
}
\description{
The results are returned as a variable as well as written to a file.
It will show all DEG over 1 fold change. It adjusts for multiple tests
using BH.
}
\examples{
results()
}
\keyword{hugene,}
\keyword{microarrays}

