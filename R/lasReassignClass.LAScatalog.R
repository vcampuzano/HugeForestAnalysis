lasReassignClass.LAScatalog <-
function(las, clss){
  output  <- catalog_apply(las, lasReassignClass.LAScluster, clss)
  output  <- unlist(output)
  output  <- catalog(output)
  return(output)
}
