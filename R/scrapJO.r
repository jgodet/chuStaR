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

dtf <- data.frame (classement = getClassement(text_rvest = text_rvest ),
                   chu = getCHU(text_rvest = text_rvest)
)
dtf$classement <- as.numeric(as.character(dtf$classement))

plotCHUchoice(dtf = dtf, col=rgb(.9,.9,1), ylim=c(0,1450))


