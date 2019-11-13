lasDenoising.LAScluster <-
function(las, offset, ...){
  las <- readLAS(las)
  if (is.empty(las)) return(NULL)
  las <- lasDenoising.LAS(las, offset, ...) 
  las <- lasfilter(las, buffer == 0)
  return(las) 
}
