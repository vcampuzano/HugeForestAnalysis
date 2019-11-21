
pRabovemean<-function(Z,R){
  zmean=mean(Z)
  prmean<-length(R[Z>=zmean])/length(R[R==1])*100
  return(prmean)
}
