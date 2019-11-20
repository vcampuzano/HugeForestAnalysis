hf.normalize <-
function(section, projcrs, path=".", cleanSrc=FALSE, showMsg=FALSE, ...){
  if(showMsg) message(paste("Normalizando catálogo LAS", section, "... "))
  fld=paste(path, section, sep="/")
  trr<-NULL
  trrTif<-list.files(fld, "*.tif")
  ctg=readLAScatalog(paste(fld, "std", sep="/"))
  if(length(trrTif)>0){
    trr <- raster(paste(fld, trrTif[1], sep="/"))
    trrBox<-bbox(trr)
    opt_filter(ctg)<-paste("-keep_xy", trrBox[1,1], trrBox[2,1], trrBox[1,2], trrBox[2,2])
  }
  opt_output_files(ctg)<-paste(fld, "nrm", "{ORIGINALFILENAME}", sep="/")
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  trrTif<-list.files(fld, "*.tif")
  plan(multisession, workers=nCores)
  if(!is.null(trr)){
    if(showMsg) message(paste("  Normalizando con MDT",trrTif[1]))
    lasnormalize(ctg, trr, na.rm=FALSE)
  } else {
    lasnormalize(ctg, knnidw(), na.rm=FALSE)
  }
  plan(sequential)
  if(cleanSrc){
    if(showMsg) message("  Eliminado archivos de origen")
    file.remove(list.files(paste(fld, "std", sep="/"), "*.las", full.names=TRUE))
    file.remove(list.files(paste(fld, "std", sep="/"), "*.lax", full.names=TRUE))
  }
  hf.createLAXcatalog(paste(fld, "nrm", sep="/"), showMsg=showMsg)
}
