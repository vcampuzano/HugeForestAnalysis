pRnabovex<-function(Z,R, n=1, x=4){
  pr1<-length(R[R==n&Z>=x])/length(R[R==n])*100
  return(pr1)
}