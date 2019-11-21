hr.runBiomass <-
  function(func, path=".", threads=2, projcrs=CRS("+init=epsg:32616"), pdfMap=FALSE, pdfHist=FALSE, showMsg=TRUE){
    set_lidr_threads(threads)
    sectionList<-list.dirs(path, full.names=FALSE, recursive=FALSE)
    rasterOptions(progress = "text", memfrac = 0.9)
    for(section in sectionList[1:length(sectionList)]){
      if(showMsg) message(paste("Generando BiomassMap", section, "... "))
      fld=paste(path, section, sep="/")
      ctg=readLAScatalog(paste(fld, "forest", sep="/"))
      opt_filter(ctg)<-"-drop_z_above 30"
      nCores=as.integer(availableCores())
      if(showMsg) message(paste("  Multisession en", nCores, "nucleos"))
      plan(multisession, workers=nCores)
      canopyRaster=grid_metrics(ctg, func)
      plan(sequential)
      projection(canopyRaster)<-projcrs
      filename=paste(fld, paste(section, "biomass", sep="_"), sep="/")
      if(showMsg) message("  Guardando tif")
      writeRaster(canopyRaster, paste(filename, "tif", sep="."),"GTiff", overwrite=TRUE)
    }
  }