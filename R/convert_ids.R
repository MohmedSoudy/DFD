#' Read Gene IDs from CSV file
#'
#'The function is used to read IDs from a CSV file
#'
#' @usage read_id(csv_path)
#'
#' @param csv_path absolute path of CSV file containing gene symbols and sign
#'
#' @return up_regulated and down_regulated genes
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
read_id <- function(csv_path){
  ids <- read.csv(csv_path)

  up_regulated <- ids[ids[,2] > 0,][,1]
  down_regulated <- ids[ids[,2] < 0,][,1]

  return(list(up_regulated, down_regulated))
}


#' Convert Gene Symbols to ENTREZ IDs
#'
#'The function is used to convert gene symbols to entrez ids and map the genes to human orthologs
#'
#' @usage convert_id(gene_symbols)
#'
#' @param gene_symbols gene symbols
#'
#' @return ENTREZ gene ids
#'
#' @examples convert_id(c("TP53", "A2M"))
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}

convert_id <- function(gene_symbols){
  converted_ids <- gconvert(toupper(gene_symbols), organism = "hsapiens", target="ENTREZGENE_ACC")
  processed_ids <- as.character(converted_ids$target)
  return(processed_ids)
}
#' Prepare IDs for CMAP Search
#'
#'The function is used to prepare the ids for the CMAP search
#'
#' @usage prepare_ids(up_regulated, down_regulated)
#'
#' @param up_regulated up regulated gene symbols
#'
#' @param down_regulated down regulated gene symbols
#'
#' @return ENTREZ gene ids
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#'
prepare_ids <- function(up_regulated, down_regulated){
  up_regulated_entrez <- convert_id(up_regulated)
  down_regulated_entrez <- convert_id(down_regulated)

  return(list(up_regulated_entrez, down_regulated_entrez))
}
