\name{hf.createLAXcatalog}
\alias{hf.createLAXcatalog}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.createLAXcatalog(path, recursive = FALSE, showMsg = FALSE, verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{recursive}{
%%     ~~Describe \code{recursive} here~~
}
  \item{showMsg}{
%%     ~~Describe \code{showMsg} here~~
}
  \item{verbose}{
%%     ~~Describe \code{verbose} here~~
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
function (path, recursive = FALSE, showMsg = FALSE, verbose = FALSE) 
{
    if (showMsg) 
        message(paste("Creando cat\303\241logo LAX", path, "... "), 
            appendLF = verbose)
    fileList <- list.files(path, "*.las", recursive = recursive)
    for (filename in fileList) {
        if (verbose) 
            print(paste(path, filename, sep = "/"))
        writelax(paste(path, filename, sep = "/"))
    }
    if (!verbose && showMsg) 
        message("OK ")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
