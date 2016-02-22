#' A function that returns your DEG in the form of nromfit 
#'
#'Then it will fit a linear models to determine the mean values of your genes
#'and use ebayes to shrink the variance
#' 
#' 
#' @param normData Normalized data.
#' @param group Data grouping.
#' @param design Design matrix.
#' @param contrast Contrast matrix
#' @keywords hugene, microarrays
#' @export
#' @examples
#' group <- factor(c((rep.int(0,13)),rep.int(1,14),rep.int(2,14)
#',rep.int(3,14),rep.int(4,14)))
#'
#'design <- model.matrix(~ 0 + group)
#'colnames(design) <- c("I","T1","T2","T3", "T4")
#'contrast <- makeContrasts( "I-T1","T1-T2","T2-T3","T3-T4",
#'                           levels= design )
#' normfit(normData, group, design, contrast)

normfit<- function(normData, group, design, contrast){

normfit <-eBayes( contrasts.fit( lmFit(normData$eset, design), contrast) )

assign("normfit",normfit, envir = .GlobalEnv)

}