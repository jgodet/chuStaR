# scrapJO.r
# written by JuG
# October 08 2019

require("XML")

u <- "https://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000037559408&categorieLien=Id"


require(rvest)
library(tidyverse)
text_rvest <- read_html(u) %>%
  html_text()
#text_rvest

#to be changed manually
start <- regexpr("1 M. Guerineau", as.character(text_rvest))[1]
stop <- regexpr("Télécharger le document en RTF", as.character(text_rvest))[1]

text <- substr(as.character(text_rvest), start, stop) 
text <- gsub(pattern = "M[.]", replacement = "Mlle",x = text) 

textSplit <- strsplit(x = text,split="[.]")
tempClass <- lapply(X = textSplit,FUN = substr, start = 1, stop = 15)
classement <- lapply(X = tempClass, FUN = numextract)[[1]]
