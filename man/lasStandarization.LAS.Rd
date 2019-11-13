\name{lasStandarization.LAS}
\alias{lasStandarization.LAS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lasStandarization.LAS(las, density = 20, denoise = TRUE, reclassify = c(), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{las}{
%%     ~~Describe \code{las} here~~
}
  \item{density}{
%%     ~~Describe \code{density} here~~
}
  \item{denoise}{
%%     ~~Describe \code{denoise} here~~
}
  \item{reclassify}{
%%     ~~Describe \code{reclassify} here~~
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
function (las, density = 20, denoise = TRUE, reclassify = c(), 
    ...) 
{
    if (denoise) {
        las <- lasDenoising.LAS(las, ...)
        gc()
    }
    las <- lasfilterdecimate(las, homogenize(density, use_pulse = TRUE))
    if (length(reclassify) > 0) {
        reclassify <- matrix(reclassify, ncol = 2)
        for (n in 1:nrow(reclassify)) las <- lasReassignClass.LAS(las, 
            reclassify[, n])
    }
    gc()
    return(las)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
