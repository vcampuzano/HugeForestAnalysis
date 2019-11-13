\name{hf.normalize}
\alias{hf.normalize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.normalize(section, projcrs, path = ".", cleanSrc = FALSE, showMsg = FALSE, ...)
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
  \item{cleanSrc}{
%%     ~~Describe \code{cleanSrc} here~~
}
  \item{showMsg}{
%%     ~~Describe \code{showMsg} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (section, projcrs, path = ".", cleanSrc = FALSE, showMsg = FALSE, 
    ...) 
{
    if (showMsg) 
        message(paste("Normalizando cat\303\241logo LAS", section, 
            "... "))
    fld = paste(path, section, sep = "/")
    ctg = readLAScatalog(paste(fld, "std", sep = "/"))
    opt_output_files(ctg) <- paste(fld, "nrm", "{ORIGINALFILENAME}", 
        sep = "/")
    projection(ctg) <- projcrs
    nCores = as.integer(availableCores()/get_lidr_threads())
    if (showMsg) 
        message(paste("  Multisession en", nCores, "nucleos con", 
            get_lidr_threads(), "hilos"))
    plan(multisession, workers = nCores)
    lasnormalize(ctg, knnidw(), na.rm = TRUE)
    plan(sequential)
    if (cleanSrc) {
        if (showMsg) 
            message("  Eliminado archivos de origen")
        file.remove(list.files(paste(fld, "std", sep = "/"), 
            "*.las", full.names = TRUE))
        file.remove(list.files(paste(fld, "std", sep = "/"), 
            "*.lax", full.names = TRUE))
    }
    hf.createLAXcatalog(paste(fld, "nrm", sep = "/"), showMsg = showMsg)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
