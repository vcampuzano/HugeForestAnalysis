hf.standarize <-
function(section, projcrs, path=".", chunk_size=512, cleanSrc=FALSE, showMsg=FALSE, ...){
  if(showMsg) message(paste("Estandarizando catálogo LAS", section, "... "))
  fld=paste(path, section, sep="/")
  ctg=readLAScatalog(fld)
  opt_chunk_size(ctg)<-chunk_size
  opt_output_files(ctg)<-paste(fld, "std", paste(section, "{ID}","{XLEFT}-{YBOTTOM}", sep="_"), sep="/")
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  plan(multisession, workers=nCores)
  lasStandarization(ctg, ...)
  plan(sequential)
  if(cleanSrc){
    if(showMsg) message("  Eliminado archivos de origen")
    file.remove(list.files(fld, "*.las", full.names=TRUE))
    file.remove(list.files(fld, "*.lax", full.names=TRUE))
  }
  hf.createLAXcatalog(paste(fld, "std", sep="/"), showMsg=showMsg)
}
