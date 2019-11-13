\name{lasStandarization.LAScatalog}
\alias{lasStandarization.LAScatalog}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lasStandarization.LAScatalog(las, density = 20, denoise = TRUE, reclassify = c(), ...)
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
    opt_select(las) <- "*"
    if (opt_chunk_buffer(las) < 9) 
        opt_chunk_buffer(las) <- 9
    options <- list(need_output_file = TRUE)
    output <- catalog_apply(las, lasStandarization.LAScluster, 
        density = density, denoise = denoise, reclassify = reclassify, 
        ..., .options = options)
    output <- unlist(output)
    output <- catalog(output)
    return(output)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
