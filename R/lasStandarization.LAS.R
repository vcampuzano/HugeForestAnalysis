lasStandarization.LAS <-
function(las, density=20, denoise=TRUE, reclassify=c(), ...){
  if(denoise){
    las <- lasDenoising.LAS(las, ...)
    gc();
  }
  las <- lasfilterdecimate(las, homogenize(density, use_pulse=TRUE))#,res=?))
  if(length(reclassify)>0){
    reclassify <- matrix(reclassify, ncol=2)
    for(n in 1:nrow(reclassify)) 
      las <- lasReassignClass.LAS(las, reclassify[,n])
  }
  gc();
  return(las)
}
