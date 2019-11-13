\name{hf.clipForest}
\alias{hf.clipForest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.clipForest(section, projcrs, forest.sp, path = ".", cleanSrc = FALSE, showMsg = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{section}{
%%     ~~Describe \code{section} here~~
}
  \item{projcrs}{
%%     ~~Describe \code{projcrs} here~~
}
  \item{forest.sp}{
%%     ~~Describe \code{forest.sp} here~~
}
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{cleanSrc}{
%%     ~~Describe \code{cleanSrc} here~~
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
function (section, projcrs, forest.sp, path = ".", cleanSrc = FALSE, 
    showMsg = FALSE) 
{
    if (showMsg) 
        message(paste("Recortando regiones forestales LAS", section, 
            "... "))
    fld = paste(path, section, sep = "/")
    ctg = readLAScatalog(paste(fld, "nrm", sep = "/"))
    opt_output_files(ctg) <- paste(fld, "forest", "{ORIGINALFILENAME}", 
        sep = "/")
    projection(ctg) <- projcrs
    nCores = as.integer(availableCores())
    if (showMsg) 
        message(paste("  Multisession en", nCores, "nucleos"))
    plan(multisession, workers = nCores)
    lasclipSpatialPolygon(ctg, forest.sp, projcrs)
    plan(sequential)
    if (cleanSrc) {
        if (showMsg) 
            message("  Eliminado archivos de origen")
        file.remove(list.files(paste(fld, "nrm", sep = "/"), 
            "*.las", full.names = TRUE))
        file.remove(list.files(paste(fld, "nrm", sep = "/"), 
            "*.lax", full.names = TRUE))
    }
    hf.createLAXcatalog(paste(fld, "forest", sep = "/"), showMsg = showMsg)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
