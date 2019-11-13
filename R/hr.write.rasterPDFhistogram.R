hr.write.rasterPDFhistogram <-
function(rasterLayer, filename, label, breaks=10, bcolor=terrain.colors(breaks)){
  rl1m<-aggregate(rasterLayer, fact=2)
  pdf(file=paste(filename,"histogram.pdf", sep="-"))
  hist(as.matrix(rl1m),col=bcolor, breaks=breaks ,xlab=label, ylab="Superficie (m²)",main="") #, xlim=c(10,30))
  dev.off()
  rm(rl1m)
}
