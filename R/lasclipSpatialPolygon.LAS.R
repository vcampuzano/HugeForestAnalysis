lasclipSpatialPolygon.LAS <-
function(las, sp, projection){
  range<-rgeos::bbox2SP(bbox=bbox(las), proj4string=projection)
  ss <- rgeos::gIntersection(sp, range, drop_lower_td=TRUE)
  if(is.null(ss)){
    return(NULL)
  }
  las<-lidR::lasclip(las, ss)
  return(las)
}
