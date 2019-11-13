\name{hr.write.rasterPDFhistogram}
\alias{hr.write.rasterPDFhistogram}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hr.write.rasterPDFhistogram(rasterLayer, filename, label, breaks = 10, bcolor = terrain.colors(breaks))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rasterLayer}{
%%     ~~Describe \code{rasterLayer} here~~
}
  \item{filename}{
%%     ~~Describe \code{filename} here~~
}
  \item{label}{
%%     ~~Describe \code{label} here~~
}
  \item{breaks}{
%%     ~~Describe \code{breaks} here~~
}
  \item{bcolor}{
%%     ~~Describe \code{bcolor} here~~
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
function (rasterLayer, filename, label, breaks = 10, bcolor = terrain.colors(breaks)) 
{
    rl1m <- aggregate(rasterLayer, fact = 2)
    pdf(file = paste(filename, "histogram.pdf", sep = "-"))
    hist(as.matrix(rl1m), col = bcolor, breaks = breaks, xlab = label, 
        ylab = "Superficie (m\302\262)", main = "")
    dev.off()
    rm(rl1m)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
