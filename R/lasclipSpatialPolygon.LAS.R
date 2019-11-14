lasclipSpatialPolygon.LAS <-
function(las, sp, projection){
  range<-rgeos::bbox2SP(bbox=bbox(las), proj4string=projection)
  ss <- gIntersection(sp, range, drop_lower_td=TRUE)
  las<-lasclip(las, ss)
  return(las)
}
