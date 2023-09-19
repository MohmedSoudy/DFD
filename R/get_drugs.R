#' Get Drugs associated with the differential expression profile
#'
#'The function is used to get list of drugs that are associated with differential expression profile
#'
#' @usage get_drugs(up_regulated, down_regulated)
#'
#' @param up_regulated up-regulated genes returned by `prepare_ids` function
#'
#' @param down_regulated down-regulated genes returned by `prepare_ids` function
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#'
get_drugs <- function(up_regulated, down_regulated){

  qsig_lincs <- qSig(query = list(upset=up_regulated, downset=down_regulated),
                    gess_method="LINCS", refdb="lincs")
  cmap <- gess_lincs(qSig=qsig_lincs, sortby = "NCS", chunk_size=5000,
                     workers=1,  addAnnotations=T)
  cmap_results <- cmap@result
  
  cmap_results <- cmap_results[cmap_results$WTCS_FDR < 0.05,]

  has_both_up_down <- function(id) {
    any(cmap_results$pert == id & cmap_results$trend == "up") && any(cmap_results$pert == id & cmap_results$trend == "down")
  }
  # Filter rows where 'a' contains an id and 'b' has both 'up' and 'down'
  one_trend <- cmap_results[!sapply(cmap_results$pert, has_both_up_down),]
  return(one_trend)
}

