# numextract.r
# written by JuG
# October 08 2019


#' Extract first numeric values from strings
#' @author JuG
#' @description 
#' @param string a string with numeric values
#' @details found on http://stla.github.io/stlapblog/posts/Numextract.html
#' @examples 
#' numextract(string = "12mL of liquor")
#' numextract(string = "12.5- or 13-mL of liquor")
#'
#' @return 
#' @export


numextract <- function(string){ 
  if(!require(stringr)){install.packages(stringr)}
  require(stringr)
  return(str_extract(string, "\\-*\\d+\\.*\\d*"))
} 
