hf.canopyHeightModel <-
function(section, projcrs, path=".", bcolor=terrain.colors(10), pdfMap=TRUE, pdfHist=TRUE, showMsg=FALSE){
  if(showMsg) message(paste("Generando CHM", section, "... "))
  fld=paste(path, section, sep="/")
  ctg=readLAScatalog(paste(fld, "nrm", sep="/"))
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  plan(multisession, workers=nCores)
  canopyRaster=grid_canopy(ctg, 0.5, algorithm =  p2r(0, na.fill=knnidw()))
  plan(sequential)
  projection(canopyRaster)<-projcrs
  filename=paste(fld, paste(section, "CHM", sep="_"), sep="/")
  if(showMsg) message("  Guardando tif")
  writeRaster(canopyRaster, paste(filename, "tif", sep="."),"GTiff", overwrite=TRUE)
  if(showMsg) message("  Guardando mapa PDF")
  if(pdfMap) hf.write.rasterPDFmap(canopyRaster, filename, "Modelo digital\r\nde dosel", bcolor=bcolor)
  if(showMsg) message("  Guardando histograma PDF")
  if(pdfHist) hf.write.rasterPDFhistogram(canopyRaster, filename, "Modelo digital de dosel (m)", bcolor=bcolor)
}
