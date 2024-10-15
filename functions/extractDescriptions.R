extractDescriptions <- function(taxa=NULL, free.description=F, delay=10) {
  ## Se der erro, mudar o timeout no javascript
  
  if (free.description == F) {
    ini.m = "Descrição com campos controlados|Description with controlled"
    final.m1 = "Descricao Livre|Descrição livre|Free description"
    final.m2 = "Comentários|Commentaries"
    final.m3 = "Vouchers"
    final.m5 = "Origem|Origin"
    final.m4 = "Bibliografia Referência|Reference"
  } else {
    ini.m = "Descricao Livre|Descrição livre|Free description"
    final.m1 = "xxxxxxxxxx"
    final.m2 = "Comentários|Commentaries"
    final.m3 = "Vouchers"
    final.m5 = "Origem|Origin"
    final.m4 = "Bibliografia Referência|Reference"
  }

    
  vector("list", length = nrow(taxa)) -> descriptions
  names(descriptions) <- taxa$scientificName
  vector() -> failures
  
  for (i in 1:nrow(taxa)) {
    try(unlink("temp.pdf"))
    taxa$references[i] -> u0
    paste(u0, "&action=print", sep="") -> u0
    try(webshot(u0, file="temp.pdf", delay=delay, useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X"))
    if (file.exists("temp.pdf")) {
      try(pdf_text("temp.pdf")) -> txt
      unlist(strsplit(as.character(txt[[1]]), "\n", fixed=T)) -> d0
      grep(ini.m, d0)+1 -> i0
      if (length(i0) > 0) {
        grep(final.m1, d0)-1 -> i1
        if (length(i1) == 0) {
          grep(final.m2, d0)-1 -> i1
        }
        if (length(i1) == 0) {
          grep(final.m3, d0)[1]-1 -> i1
          na.omit(i1) -> i1
        }
        if (length(i1) == 0) {
          grep(final.m4, d0)[1]-1 -> i1
          na.omit(i1) -> i1
        }
        if (length(i1) == 0) {
          grep(final.m5, d0)[1]-1 -> i1
          na.omit(i1) -> i1
        }
        d0[i0:i1] -> d0
        gsub("PT\r", "", d0, fixed=T) -> d0
        gsub("EN\r", "", d0, fixed=T) -> d0
        gsub("\r", "", d0, fixed=T) -> d0
        trimws(d0) -> d0
        paste(d0, collapse = " ") -> d0
        trimws(d0) -> d0
        d0 -> descriptions[[i]]
      } else {
        c(failures, taxa$scientificName[i]) -> failures
    } 
    
    } else {
      c(failures, taxa$scientificName[i]) -> failures
    }
    cat("\r",i)
  }
  if (length(failures) > 0) {
    list(descriptions, failures) -> descriptions
  }
  return(descriptions)
}
