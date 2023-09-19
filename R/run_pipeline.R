#' Run the main pipeline for getting drugs from differentail expression profile
#'
#'The function is used to run the main pipeline by extracting the drug list given differential expressed genes
#'
#' @usage run_pipeline(degs_path, output_path = NULL)
#'
#' @param degs_path path to csv file containing degs see example file at https://raw.githubusercontent.com/MohmedSoudy/datasharing/master/differential-expression.csv
#'
#' @param output_path absolute path to output directory
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#'
run_pipeline <- function(degs_path, output_path = NULL){

  #Read the DEGs into lists
  degs <- read_id(degs_path)
  #Process the DEGs to be prepared for CMAP search
  degs_processed <- prepare_ids(degs[[1]], degs[[2]])
  #Get the list of drugs
  perts <- get_drugs(degs_processed[[1]], degs_processed[[2]])
  if (dim(perts)[1] < 0){
   message("There is No significant drugs associated with your query.")
    return()
  }
  processed_perts <- filter_drugs(perts)
  if(!is.null(output_path)){
    write.csv(processed_perts, file = paste0(output_path, "/Predicted_drugs.csv"), row.names = F)
  }
  return(processed_perts)
  }
