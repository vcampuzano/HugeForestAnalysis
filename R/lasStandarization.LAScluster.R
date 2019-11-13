lasStandarization.LAScluster <-
function(las, density, denoise, reclassify, ...){
  las <- readLAS(las)
  if (is.empty(las)) return(NULL)
  las <- lasStandarization.LAS(las, density=density, denoise=denoise, reclassify=reclassify, ...) 
  las <- lasfilter(las, buffer == 0)
  return(las) 
}
