hf.terrainModel <-
function(section, projcrs, path=".", bcolor=terrain.colors(10), pdfMap=TRUE, pdfHist=TRUE, showMsg=FALSE){
  if(showMsg) message(paste("Generando MDT", section, "... "))
  fld=paste(path, section, sep="/")
  ctg=readLAScatalog(paste(fld, "std", sep="/"))
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores()/get_lidr_threads())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos con", get_lidr_threads(), "hilos"))
  plan(multisession, workers=nCores)
  terrainRaster=grid_terrain(ctg, 0.5, knnidw())
  plan(sequential)
  projection(terrainRaster)<-projcrs
  filename=paste(fld, paste(section, "MDT", sep="_"), sep="/")
  if(showMsg) message("  Guardando tif")
  writeRaster(terrainRaster, paste(filename, "tif", sep="."),"GTiff", overwrite=TRUE)
  if(showMsg) message("  Guardando mapa PDF")
  if(pdfMap) hr.write.rasterPDFmap(terrainRaster, filename, "Modelo digital\r\nde terreno", bcolor=bcolor)
  if(showMsg) message("  Guardando histograma PDF")
  if(pdfHist) hr.write.rasterPDFhistogram(terrainRaster, filename, "Modelo digital de terreno (m)", bcolor=bcolor)
}
