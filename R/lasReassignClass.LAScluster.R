lasReassignClass.LAScluster <-
function(las, clss){
  las <- readLAS(las)
  if (is.empty(las)) return(NULL)
  las <- lasReassignClass.LAS(las, clss) 
  return(las) 
}
