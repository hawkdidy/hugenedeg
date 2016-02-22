#' A function that does a complte DEGA from start to finish
#'
#' This function allows you to do a complete differntial gene expression
#' analysis your hugene 2.0 St array data.
#' It will return three global variables. raWData which is the unnormalized gene expression values and
#' normData which are the log2 normalized gene expression values. Results which is the results of the analysis.
#' 
#' @param mydir The directory that contains your data. 
#' @param group Group of factors in your experiment
#' @param design Design matrix with named columns
#' @param contrast contrast matrix 
#' @keywords hugene, microarrays
#' @export
#' @examples
#'
#' coman(mydir, group, design, contrast)

coman <- function(mydir, group, design, contrast){

lonoan(mydir)

filterc(normData)

normfit(normData, group, design, contrast)

return(normData.filtered$filter.log)

assign("normfit",normfit, envir = .GlobalEnv)

results(normfit)

}
