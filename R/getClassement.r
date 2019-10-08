# getClassement.r
# written by JuG
# October 08 2019


#' Extract ranking
#' @author JuG
#' @description 
#' @param text_rvest harvested html text
#' @param  stringStart expression where to start extracting
#' @param  stringStop expression where to end extracting 
#' @details 
#' @examples 
#'
#'
#' @return 
#' @export


getClassement<- function(text_rvest, stringStart = "1 M. Guerineau",stringStop = "Télécharger le document en RTF" ){
  #to be changed manually
  start <- regexpr(stringStart, as.character(text_rvest))[1]
  stop <- regexpr(stringStop, as.character(text_rvest))[1]
  
  text <- substr(as.character(text_rvest), start, stop) 
  text <- gsub(pattern = "M[.]", replacement = "Mlle",x = text) 
  
  textSplit <- strsplit(x = text,split="[.]")
  tempClass <- lapply(X = textSplit,FUN = substr, start = 1, stop = 15)
  classement <- lapply(X = tempClass, FUN = numextract)[[1]]
  return(classement)
}