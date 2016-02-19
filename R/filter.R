#' A Function to filter genes
#'
#' This function will filter out genes that don't change throughout the time points
#' it will also filter out the control probs. It will return the number of features
#' filtered.
#' 
#' @param normData The normalized data.
#' @keywords hugene, microarrays
#' @export
#' @examples
#' filterc()

#filtering of genes, removing all control probes and seeing what is filtered 
filterc <- function(normData){
  
eset <- getMainProbes(normData)

normData.filtered <- nsFilter(eset, require.entrez=FALSE, remove.dupEntrez=FALSE, feature.exclude = probes.control)

return(normData.filtered$filter.log)

assign("normData",normData.filtered, envir = .GlobalEnv)

}


