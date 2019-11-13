\name{hf.canopyHeightModel}
\alias{hf.canopyHeightModel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.canopyHeightModel(section, projcrs, path = ".", bcolor = terrain.colors(10), pdfMap = TRUE, pdfHist = TRUE, showMsg = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{section}{
%%     ~~Describe \code{section} here~~
}
  \item{projcrs}{
%%     ~~Describe \code{projcrs} here~~
}
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{bcolor}{
%%     ~~Describe \code{bcolor} here~~
}
  \item{pdfMap}{
%%     ~~Describe \code{pdfMap} here~~
}
  \item{pdfHist}{
%%     ~~Describe \code{pdfHist} here~~
}
  \item{showMsg}{
%%     ~~Describe \code{showMsg} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (section, projcrs, path = ".", bcolor = terrain.colors(10), 
    pdfMap = TRUE, pdfHist = TRUE, showMsg = FALSE) 
{
    if (showMsg) 
        message(paste("Generando CHM", section, "... "))
    fld = paste(path, section, sep = "/")
    ctg = readLAScatalog(paste(fld, "nrm", sep = "/"))
    nCores = as.integer(availableCores()/get_lidr_threads())
    if (showMsg) 
        message(paste("  Multisession en", nCores, "nucleos con", 
            get_lidr_threads(), "hilos"))
    plan(multisession, workers = nCores)
    canopyRaster = grid_canopy(ctg, 0.5, algorithm = p2r(0, na.fill = knnidw()))
    plan(sequential)
    projection(canopyRaster) <- projcrs
    filename = paste(fld, paste(section, "CHM", sep = "_"), sep = "/")
    if (showMsg) 
        message("  Guardando tif")
    writeRaster(canopyRaster, paste(filename, "tif", sep = "."), 
        "GTiff", overwrite = TRUE)
    if (showMsg) 
        message("  Guardando mapa PDF")
    if (pdfMap) 
        hr.write.rasterPDFmap(canopyRaster, filename, "Modelo digital\r\nde dosel", 
            bcolor = bcolor)
    if (showMsg) 
        message("  Guardando histograma PDF")
    if (pdfHist) 
        hr.write.rasterPDFhistogram(canopyRaster, filename, "Modelo digital de dosel (m)", 
            bcolor = bcolor)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
