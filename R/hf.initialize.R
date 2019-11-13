hf.initialize <-
function(section, path=".", clean=FALSE, mode="0771", showMsg=FALSE){
  if(showMsg) message(paste("Crear subdirectorios", section,"... ") , appendLF = FALSE)
  fld=paste(path, section, sep="/")
  stdPath<-paste(fld, "std", sep="/")
  nrmPath<-paste(fld, "nrm", sep="/")
  forestPath<-paste(fld, "forest", sep="/")
  
  if(clean){
    file.remove(list.files(fld, "*.lax", full.names=TRUE))
    file.remove(list.files(stdPath, all.files=TRUE, recursive=TRUE, full.names=TRUE))
    file.remove(list.files(nrmPath, all.files=TRUE, recursive=TRUE, full.names=TRUE))
    file.remove(list.files(forestPath, all.files=TRUE, recursive=TRUE, full.names=TRUE))
  }
  
  if(!dir.exists(stdPath)) dir.create(stdPath, mode=mode)
  if(!dir.exists(nrmPath)) dir.create(nrmPath, mode=mode)
  if(!dir.exists(forestPath)) dir.create(forestPath, mode=mode)
  if(showMsg) message("OK ")
  hf.createLAXcatalog(fld, showMsg=showMsg)
  return(fld)
}
