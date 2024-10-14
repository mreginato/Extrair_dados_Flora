getFloraTaxa <- function(family=NULL, genus=NULL, data=NULL, check.correct=T) {
  data -> taxons
  taxons[which(taxons$family == family),] -> taxons
  taxons[which(taxons$taxonomicStatus == "NOME_ACEITO"),] -> taxons
  if (check.correct) {
    taxons[which(taxons$nomenclaturalStatus == "NOME_CORRETO"),] -> taxons
  }
  taxons[which(taxons$taxonRank == "ESPECIE"),] -> taxons
  taxons[which(taxons$genus == genus),] -> taxa
  return(taxa)
}