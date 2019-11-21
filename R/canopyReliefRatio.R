canopyReliefRatio<-function(Z){
  zmin<-min(Z)
  return((mean(Z)-zmin)/(max(Z)-zmin))
}