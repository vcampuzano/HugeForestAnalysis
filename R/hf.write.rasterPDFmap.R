hf.write.rasterPDFmap <-
function(rasterLayer, filename, mapTitle, bcolor=terrain.colors(10)){
  grid.df<-data.frame(rasterToPoints(rasterLayer))
  colnames(grid.df)<-c("x","y","map")
  ggplot(grid.df, aes(x,y)) +
    theme_minimal()+
    geom_raster(aes(fill=map))+
    coord_fixed(ratio=1)+
    scale_fill_gradientn(mapTitle ,colors = bcolor)+
    #scalebar(sCHM.df, dist=0.5, height=.1, dd2km=FALSE, model="WGS84")+
    theme(axis.text.y = element_text(angle = 90,hjust=0), legend.position = "right")
  ggsave(paste(filename,"map.pdf", sep="-"), width=8.5, height=11, units="in")
}
