hf.runAnalysis <-
function(path=".", threads=2, projcrs=CRS("+init=epsg:32616"), pdfMap=FALSE, pdfHist=FALSE, showMsg=TRUE){
  set_lidr_threads(threads)
  sectionList<-list.dirs(path, full.names=FALSE, recursive=FALSE)
  for(section in sectionList[1:length(sectionList)]){
    hf.canopyHeightModel(section, projcrs, path=path, pdfHist=pdfHist, showMsg=showMsg)
    chm<-raster(paste(path, section, paste(section, "CHM.tif", sep="_"), sep="/"))
    chm<-clamp(chm, lower=0, upper=62, filename=paste(path, section, paste(section, "CHMclamp.tif", sep="_"), sep="/"))
    #chm<-raster(paste(path, section, paste(section, "CHMclamp.tif", sep="_"), sep="/"))
    fsp<-readOGR(paste(path, section, sep="/"), paste(section, "Poligonos forestales", sep="_"))
    chm<-mask(chm, fsp, filename=paste(path, section, paste(section, "MEC.tif", sep="_"), sep="/"))
  }
}
