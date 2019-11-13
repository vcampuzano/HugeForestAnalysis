\name{hf.initialize}
\alias{hf.initialize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.initialize(section, path = ".", clean = FALSE, mode = "0771", showMsg = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{section}{
%%     ~~Describe \code{section} here~~
}
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{clean}{
%%     ~~Describe \code{clean} here~~
}
  \item{mode}{
%%     ~~Describe \code{mode} here~~
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
function (section, path = ".", clean = FALSE, mode = "0771", 
    showMsg = FALSE) 
{
    if (showMsg) 
        message(paste("Crear subdirectorios", section, "... "), 
            appendLF = FALSE)
    fld = paste(path, section, sep = "/")
    stdPath <- paste(fld, "std", sep = "/")
    nrmPath <- paste(fld, "nrm", sep = "/")
    forestPath <- paste(fld, "forest", sep = "/")
    if (clean) {
        file.remove(list.files(fld, "*.lax", full.names = TRUE))
        file.remove(list.files(stdPath, all.files = TRUE, recursive = TRUE, 
            full.names = TRUE))
        file.remove(list.files(nrmPath, all.files = TRUE, recursive = TRUE, 
            full.names = TRUE))
        file.remove(list.files(forestPath, all.files = TRUE, 
            recursive = TRUE, full.names = TRUE))
    }
    if (!dir.exists(stdPath)) 
        dir.create(stdPath, mode = mode)
    if (!dir.exists(nrmPath)) 
        dir.create(nrmPath, mode = mode)
    if (!dir.exists(forestPath)) 
        dir.create(forestPath, mode = mode)
    if (showMsg) 
        message("OK ")
    hf.createLAXcatalog(fld, showMsg = showMsg)
    return(fld)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
