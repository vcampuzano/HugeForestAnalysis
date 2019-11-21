hf.forestSPmask <-
function(section, projcrs, path=".", height=2, res=5, pclump=75, holes_area=7500, crumbs_area=10000, showMsg=FALSE){
  if(showMsg) message(paste("Identificando regiones forestales", section, "... "))
  fld<-paste(path, section, sep="/")
  ctg<-readLAScatalog(paste(fld, "nrm", sep="/"))
  opt_filter(ctg)<-"-drop_z_below 0"
  projection(ctg)<-projcrs
  nCores=as.integer(availableCores())
  if(showMsg) message(paste("  Multisession en", nCores, "nucleos"))
  plan(multisession, workers=nCores)
  grid.pzabove2=grid_metrics(ctg, .pzabovex(Z, th=2), res=5)#th=height), res=res)
  plan(sequential)
  if(showMsg) message(paste("  Creando polígono a corte de", height, "m ..."))
  forest.sp=raster::rasterToPolygons(clump(grid.pzabove2>pclump), dissolve = TRUE)
  if(showMsg) message(paste("  Incluyendo claros menores a", holes_area, "m² ..."))
  forest.sp<-fill_holes(forest.sp, holes_area)
  if(showMsg) message(paste("  Descartando parches menores a", crumbs_area, "m² ..."))
  forest.sp<-drop_crumbs(forest.sp, crumbs_area)
  projection(forest.sp)<-projcrs
  return(forest.sp)
}
