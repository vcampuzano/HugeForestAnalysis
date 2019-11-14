hf.runLASprocesor <-
function(path=".", threads=2, chunk_size=512, projcrs=CRS("+init=epsg:32616"), reclassify=c(), showMsg=TRUE){
  set_lidr_threads(threads)
  sectionList<-list.dirs(path, full.names=FALSE)
  for(section in sectionList[2:length(sectionList)]){
    
    fld<-hf.initialize(section, path=path, clean=TRUE, showMsg=showMsg)
    
    hf.standarize(section, projcrs, path=path, cleanSrc=TRUE, chunk_size=chunk_size, showMsg=showMsg, reclassify=reclassify)
    gc()
    
    hf.normalize(section, projcrs, path=path, showMsg=showMsg)
    gc()
    
    fsp<-hf.forestSPmask(section, projcrs, path=path, holes_area=5000, crumbs_area=8000, showMsg=showMsg)
    if(showMsg) message("Guardando polígonos forestales...")
    writeOGR(fsp, fld, paste(section, "Poligonos forestales", sep="_"), driver="ESRI Shapefile")
    gc()
    
    hf.clipForest(section, projcrs, fsp, path=path, showMsg=showMsg) #readOGR(fld, paste(section, "Poligonos forestales", sep="_"))
  }
}
