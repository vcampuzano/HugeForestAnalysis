hf.runAnalysis <-
function(path=".", threads=2, projcrs=CRS("+init=epsg:32616"), showMsg=TRUE){
  set_lidr_threads(threads)
  sectionList<-list.dirs(path, full.names=FALSE)
  for(section in sectionList[2:length(sectionList)]){
    hf.terrainModel(section, projcrs, path=path, showMsg=showMsg)
    hf.canopyHeightModel(section, projcrs, path=path, showMsg=showMsg)
  }
}