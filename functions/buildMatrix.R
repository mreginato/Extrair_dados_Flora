buildMatrix <- function(descriptions=NULL) {
  descriptions[[1]] -> d0
  trimws(unlist(strsplit(d0, ".", fixed=T))) -> d0
  unlist(lapply(strsplit(d0, ":"), "[", 1)) -> chars.main
  unlist(lapply(strsplit(d0, ";"), length)) -> n
  rep(chars.main, n) -> chars.all
  
  dat <- matrix(ncol=length(chars.all), nrow=length(descriptions))
  colnames(dat) <- chars.all
  rownames(dat) <- names(descriptions)
  
  for (i in 1:length(descriptions)) {
    descriptions[[i]] -> d0
    trimws(unlist(strsplit(d0, ". ", fixed=T))) -> d0
    d0[1:length(chars.main)] -> d0
    unlist(lapply(strsplit(d0, ": "), "[", 2)) -> d0
    trimws(unlist(strsplit(d0, ";"))) -> d0
    if (length(d0) == ncol(dat)) {
      d0 -> dat[i,]
    }
  }
  return(dat)
}