hf.normalize <-
function(section, projcrs, path=".", cleanSrc=FALSE, showMsg=FALSE, ...){
  if(showMsg) message(paste("Normalizando catálogo LAS", section, "... "))
  fld=paste(path, section, sep="/")
  ctg=readLAScatalog(paste(fld, "std", sep="/"))
  opt_output_files(ctg)<-paste(fld, "nrm", "{ORIGINALFILENAME}", sep="/")
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  plan(multisession, workers=nCores)
  lasnormalize(ctg, knnidw(), na.rm=TRUE)
  plan(sequential)
  if(cleanSrc){
    if(showMsg) message("  Eliminado archivos de origen")
    file.remove(list.files(paste(fld, "std", sep="/"), "*.las", full.names=TRUE))
    file.remove(list.files(paste(fld, "std", sep="/"), "*.lax", full.names=TRUE))
  }
  hf.createLAXcatalog(paste(fld, "nrm", sep="/"), showMsg=showMsg)
}
