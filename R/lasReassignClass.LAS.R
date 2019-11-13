lasReassignClass.LAS <-
function(las, clss){
  classification <- las@data$Classification
  classification[classification==clss[1]] <- clss[2]
  las@data$Classification <- classification
  return(las)
}
