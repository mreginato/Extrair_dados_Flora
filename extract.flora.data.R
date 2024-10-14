library(pdftools)
library(data.table)
library(dplyr)
library(webshot)

setwd("F:/a_Disciplinas/BOT00176 - Bioinfomática-Pós/Aulas/2 - Morfometria/Roteiros/extract_flora")
getwd() -> wd

####################################################
### Import functions
####################################################

source("https://raw.githubusercontent.com/mreginato/Extrair_dados_Flora/refs/heads/main/functions/getFloraTaxa.R")
source("https://raw.githubusercontent.com/mreginato/Extrair_dados_Flora/refs/heads/main/functions/extractDescriptions.R")
source("https://raw.githubusercontent.com/mreginato/Extrair_dados_Flora/refs/heads/main/functions/buildMatrix.R")

####################################################
### Import Flora Data
####################################################

### fread lê direto

fread("taxon.txt", stringsAsFactors = F) -> flora
as.data.frame(flora, stringsAsFactors=F) -> flora

####################################################
### Extract taxa
####################################################

family = "Melastomataceae"
genus = "Pleiochiton"

getFloraTaxa(family, genus, data=flora, check.correct = F) -> taxa
nrow(taxa)

####################################################
### Load pages
####################################################

extractDescriptions(taxa, free.description = F, delay = 10) -> descriptions

descriptions
length(descriptions)

sink(paste(genus, "descriptions.txt", sep="_"))
descriptions
sink()

save.image("work.Rdata")

####################################################
### Build matrix
####################################################

if (length(descriptions) == 2) {
  descriptions[[1]] -> x
  length(x)
  x[which(lapply(x, is.null) == F)] -> descriptions[[1]]
  length(descriptions[[1]])
  descriptions[[1]] -> descriptions
  buildMatrix(descriptions) -> mat
} else {
  length(descriptions) 
  descriptions[which(lapply(descriptions, is.null) == F)] -> descriptions
  length(descriptions) 
  buildMatrix(descriptions) -> mat
}


write.csv(mat, paste(genus, "_matrix.csv", sep=""))



