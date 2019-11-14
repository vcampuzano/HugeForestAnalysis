lasclipSpatialPolygon.LAScluster <-
function(las, sp, projection){
  las<-readLAS(las)
  if(is.empty(las)) return(NULL)
  las<-lasclipSpatialPolygon.LAS(las, sp, projection=projection)
  if(!is.null(las))
    las <- lasfilter(las, buffer == 0)
  else 
    print("las es NULL")
  return(las)
}
