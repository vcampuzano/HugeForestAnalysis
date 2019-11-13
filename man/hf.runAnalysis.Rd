\name{hf.runAnalysis}
\alias{hf.runAnalysis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.runAnalysis(path = ".", threads = 2, projcrs = CRS("+init=epsg:32616"), showMsg = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{threads}{
%%     ~~Describe \code{threads} here~~
}
  \item{projcrs}{
%%     ~~Describe \code{projcrs} here~~
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
function (path = ".", threads = 2, projcrs = CRS("+init=epsg:32616"), 
    showMsg = TRUE) 
{
    set_lidr_threads(threads)
    sectionList <- list.dirs(path, full.names = FALSE)
    for (section in sectionList[2:length(sectionList)]) {
        hf.terrainModel(section, projcrs, path = path, showMsg = showMsg)
        hf.canopyHeightModel(section, projcrs, path = path, showMsg = showMsg)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
