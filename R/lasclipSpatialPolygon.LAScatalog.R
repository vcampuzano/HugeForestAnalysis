lasclipSpatialPolygon.LAScatalog <-
function(ctg, sp, projection){
  # Force some options
  #opt_select(las) <-  "*"          # Do not respect the select argument
  opt_chunk_buffer(ctg) <- 0    # Force the buffer to be 0.
  # Add this option to throw an error if no output template is provided
  #options <- list(need_output_file = TRUE)
  output<-catalog_apply(ctg, lasclipSpatialPolygon.LAScluster, sp=sp, projection=projection)
  output<-unlist(output)
  return(output)
}
