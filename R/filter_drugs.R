#' Re-rank drugs based on the number of targets
#'
#'The function is used to re-rank drugs based on their targets
#'
#' @usage filter_drugs(drug_frame)
#'
#' @param drug_frame drugs data frame returned by `get_drugs` function
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#'
filter_drugs <- function(drug_frame){

  #filter genes with missing targets
  drug_frame <- drug_frame[!is.na(drug_frame$t_gn_sym), ]
  
  drug_frame$target_count <- str_count(drug_frame$t_gn_sym, 
                                       ";")
  drug_frame <- drug_frame[drug_frame$target_count != 
                             0, ]
  drug_frame <- drug_frame[order(drug_frame$target_count, 
                                 decreasing = T), ]
  return(drug_frame)
}
