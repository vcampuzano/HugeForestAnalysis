lasDenoising.LAScatalog <-
function(las, offset=1, ...){
  opt_select(las) <-  "*"
  opt_chunk_buffer(las) <- 0
  options <- list(need_output_file = TRUE)
  output  <- catalog_apply(las, lasDenoising.LAScluster, offset, ..., .options = options)
  output  <- unlist(output)
  output  <- catalog(output)
  return(output)
}
