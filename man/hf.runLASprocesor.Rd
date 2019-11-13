\name{hf.runLASprocesor}
\alias{hf.runLASprocesor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.runLASprocesor(path = ".", threads = 2, chunk_size = 512, projcrs = CRS("+init=epsg:32616"), reclassify = c(), showMsg = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{threads}{
%%     ~~Describe \code{threads} here~~
}
  \item{chunk_size}{
%%     ~~Describe \code{chunk_size} here~~
}
  \item{projcrs}{
%%     ~~Describe \code{projcrs} here~~
}
  \item{reclassify}{
%%     ~~Describe \code{reclassify} here~~
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
function (path = ".", threads = 2, chunk_size = 512, projcrs = CRS("+init=epsg:32616"), 
    reclassify = c(), showMsg = TRUE) 
{
    set_lidr_threads(threads)
    sectionList <- list.dirs(path, full.names = FALSE)
    for (section in sectionList[2:length(sectionList)]) {
        fld <- hf.initialize(section, path = path, clean = TRUE, 
            showMsg = showMsg)
        hf.standarize(section, projcrs, path = path, cleanSrc = TRUE, 
            showMsg = showMsg, reclassify = reclassify)
        gc()
        hf.normalize(section, projcrs, path = path, showMsg = showMsg)
        gc()
        fsp <- hf.forestSPmask(section, projcrs, path = path, 
            holes_area = 5000, crumbs_area = 8000, showMsg = showMsg)
        if (showMsg) 
            message("Guardando pol\303\255gonos forestales...")
        writeOGR(fsp, fld, paste(section, "Poligonos forestales", 
            sep = "_"), driver = "ESRI Shapefile")
        gc()
        hf.clipForest(section, projcrs, fsp, path = path, showMsg = showMsg)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
