\name{hf.forestSPmask}
\alias{hf.forestSPmask}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.forestSPmask(section, projcrs, path = ".", height = 2, res = 5, pclump = 75, holes_area = 7500, crumbs_area = 10000, showMsg = FALSE)
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
  \item{height}{
%%     ~~Describe \code{height} here~~
}
  \item{res}{
%%     ~~Describe \code{res} here~~
}
  \item{pclump}{
%%     ~~Describe \code{pclump} here~~
}
  \item{holes_area}{
%%     ~~Describe \code{holes_area} here~~
}
  \item{crumbs_area}{
%%     ~~Describe \code{crumbs_area} here~~
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
function (section, projcrs, path = ".", height = 2, res = 5, 
    pclump = 75, holes_area = 7500, crumbs_area = 10000, showMsg = FALSE) 
{
    if (showMsg) 
        message(paste("Identificando regiones forestales", section, 
            "... "))
    fld <- paste(path, section, sep = "/")
    ctg <- readLAScatalog(paste(fld, "nrm", sep = "/"))
    opt_filter(ctg) <- "-drop_z_below 0"
    projection(ctg) <- projcrs
    nCores = as.integer(availableCores())
    if (showMsg) 
        message(paste("  Multisession en", nCores, "nucleos"))
    plan(multisession, workers = nCores)
    grid.pzabove2 = grid_metrics(ctg, ~pzabovex(Z, th = 2), res = 5)
    plan(sequential)
    if (showMsg) 
        message(paste("  Creando pol\303\255gono a corte de", 
            height, "m ..."))
    forest.sp = raster::rasterToPolygons(clump(grid.pzabove2 > 
        pclump), dissolve = TRUE)
    if (showMsg) 
        message(paste("  Incluyendo claros menores a", holes_area, 
            "m\302\262 ..."))
    forest.sp <- fill_holes(forest.sp, holes_area)
    if (showMsg) 
        message(paste("  Descartando parches menores a", crumbs_area, 
            "m\302\262 ..."))
    forest.sp <- drop_crumbs(forest.sp, crumbs_area)
    projection(forest.sp) <- projcrs
    return(forest.sp)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
