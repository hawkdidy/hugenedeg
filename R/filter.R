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
  
con <- db(pd.hugene.2.0.st)

probes.control <- dbGetQuery(con, "select fsetid from featureSet where
                             type in ('3', '5','6','7','8','9','10','11','12','13','14','15','16','17');")[,1]

normData.filtered <- nsFilter(normData, require.entrez=FALSE, remove.dupEntrez=FALSE, feature.exclude = probes.control)

return(normData.filtered$filter.log)

assign("normData",normData.filtered, envir = .GlobalEnv)

}
