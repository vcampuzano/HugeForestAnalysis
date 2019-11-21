
pzcanopy=function(r, z, th, zq=NULL){
  if(is.null(zq)) zq = stats::quantile(z, 0.95)/th
  return(pzabovex(z[r==1], th=zq))
}
