lasclipSpatialPolygon.LAScluster <-
function(las, sp, projection){
  las<-readLAS(las)
  if(is.empty(las)) return(NULL)
  las<-lasclipSpatialPolygon.LAS(las, sp, projection=projection)
  las <- lasfilter(las, buffer == 0)
  return(las)
}
