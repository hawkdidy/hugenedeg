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
#'group <- factor(c((rep.int(0,13)),rep.int(1,14),rep.int(2,14)
#'rep.int(3,14),rep.int(4,14)))
#'design <- model.matrix(~ 0 + group)
#'colnames(design) <- c("I","T1","T2","T3", "T4")
#'contrast matrix 
#'contrast <- makeContrasts( "I-T1","T1-T2","T2-T3","T3-T4",
#'                           levels= design )
#'
#' coman(mydir, group, design, contrast)

coman <- function(mydir, group, design, contrast){
  
#listing the files from directory using special CEL file read function
celList <- list.celfiles(mydir, full.names=TRUE)
#reading data from cellist and setting annotation package to approiate one for this microarray
rawData <- read.celfiles(celList, pkgname='pd.hugene.2.0.st')
#normalizing the data using RMA algorithm
normData <- rma(rawData, target="core")
#retreaving feature data
featureData(normData) <- getNetAffx(normData, "transcript")

eset <- getMainProbes(normData)

normData.filtered <- nsFilter(eset, require.entrez=FALSE, remove.dupEntrez=FALSE)

return(normData.filtered$filter.log)

normfit <-eBayes( contrasts.fit( lmFit(normData$eset, design), contrast) )

#getting the list of probes
probeset.list <-topTable(normfit,number=100000, adjust="BH", lfc=1)

#writing results to a tab delimated text file
write.table(probeset.list,file="DEGS_ALL_CONTRAST.txt",sep= "\t" )

assign("results",probeset.list, envir = .GlobalEnv)

assign("normData",normData.filtered, envir = .GlobalEnv)

assign("rawData", rawData, envir = .GlobalEnv)



}
