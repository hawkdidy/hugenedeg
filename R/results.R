#'This function gets the results of the analysis and writes them to a file
#'
#'The results are returned as a variable as well as written to a file.
#'It will show all DEG over 1 fold change. It adjusts for multiple tests
#'using BH.
#' 
#' @param normfit Model of your data fit to a linear model
#' @keywords hugene, microarrays
#' @export
#' @examples
#' results()

results <- function(normfit){
  
#getting the list of probes
probeset.list <- topTable(normfit,number=100000, adjust="BH", lfc=1)

#Adding gene symbol to dataset 
Symbol <- getSYMBOL(rownames(probeset.list), "hugene20sttranscriptcluster.db")

return (results <- cbind(probeset.list, Symbol))


#writing results to a tab delimated text file
#write.table(results,file="DEGS_ALL_CONTRAST.txt",sep= "\t" )

#assign("results",results, envir = .GlobalEnv)

}