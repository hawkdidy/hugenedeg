#' A Function to Load, Normalize, and Annotate
#'
#' This function allows you load, normalize, and annotate your hugene 2.0 St array data.
#' It will return two global variables. raWData which is the unnormalized gene expression values and
#' normData which are the log2 normalized gene expression values.
#' 
#' @param mydir The directory that contains your data.
#' @keywords hugene, microarrays
#' @export
#' @examples
#' lonoan()

lonoan <- function(mydir){
  
#listing the files from directory using special CEL file read function
celList <- list.celfiles(mydir, full.names=TRUE)
#reading data from cellist and setting annotation package to approiate one for this microarray
rawData <- read.celfiles(celList, pkgname='pd.hugene.2.0.st')
#normalizing the data using RMA algorithm
normData <- rma(rawData, target="core")
#retreaving feature data
featureData(normData) <- getNetAffx(normData, "transcript")

assign("rawData", rawData, envir = .GlobalEnv)
assign("normData",normData, envir = .GlobalEnv)


}
