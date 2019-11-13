lasStandarization.LAScatalog <-
function(las, density=20, denoise=TRUE, reclassify=c(), ...){
  opt_select(las) <-  "*"
  if(opt_chunk_buffer(las)<9) opt_chunk_buffer(las) <- 9
  options <- list(need_output_file = TRUE)
  output  <- catalog_apply(las, lasStandarization.LAScluster, density=density, denoise=denoise, reclassify=reclassify, ..., .options = options)
  output  <- unlist(output)
  output  <- catalog(output)
  return(output)
}
