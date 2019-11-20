hf.clipForest <-
function(section, projcrs, forest.sp, path=".", cleanSrc=FALSE, showMsg=FALSE){
  if(showMsg) message(paste("Recortando regiones forestales LAS", section, "... "))
  fld=paste(path, section, sep="/")
  ctg=readLAScatalog(paste(fld, "nrm", sep="/"))
  opt_output_files(ctg)<-paste(fld, "forest", "{ORIGINALFILENAME}", sep="/")
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  plan(multisession, workers = nCores)
  lasclipSpatialPolygon(ctg, forest.sp, projcrs)
  plan(sequential)
  if(cleanSrc){
    if(showMsg) message("  Eliminado archivos de origen")
    file.remove(list.files(paste(fld, "nrm", sep="/"), "*.las", full.names=TRUE))
    file.remove(list.files(paste(fld, "nrm", sep="/"), "*.lax", full.names=TRUE))
  }
  hf.createLAXcatalog(paste(fld, "forest", sep="/"), showMsg=showMsg)
}
