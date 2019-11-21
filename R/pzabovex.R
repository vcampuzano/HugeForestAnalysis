pzabovex=function(z, th=2, n=NULL){
  if(is.null(n)) n=length(z)
  return(length(z[z > th]) / n * 100)
}