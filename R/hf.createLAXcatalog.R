hf.createLAXcatalog <-
function(path, recursive=FALSE, showMsg=FALSE, verbose=FALSE){
  if(showMsg) message(paste("Creando catálogo LAX", path, "... "), appendLF = verbose)
  fileList<-list.files(path, "*.las", recursive=recursive)
  for(filename in fileList){
    if(verbose) print(paste(path, filename, sep="/"))
    writelax(paste(path, filename, sep="/"))
  }
  if(!verbose&&showMsg) message("OK ")
}
