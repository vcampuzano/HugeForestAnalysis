\name{hf.write.rasterPDFmap}
\alias{hf.write.rasterPDFmap}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hf.write.rasterPDFmap(rasterLayer, filename, mapTitle, bcolor = terrain.colors(10))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rasterLayer}{
%%     ~~Describe \code{rasterLayer} here~~
}
  \item{filename}{
%%     ~~Describe \code{filename} here~~
}
  \item{mapTitle}{
%%     ~~Describe \code{mapTitle} here~~
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
function (rasterLayer, filename, mapTitle, bcolor = terrain.colors(10)) 
{
    grid.df <- data.frame(rasterToPoints(rasterLayer))
    colnames(grid.df) <- c("x", "y", "map")
    ggplot(grid.df, aes(x, y)) + theme_minimal() + geom_raster(aes(fill = map)) + 
        coord_fixed(ratio = 1) + scale_fill_gradientn(mapTitle, 
        colors = bcolor) + theme(axis.text.y = element_text(angle = 90, 
        hjust = 0), legend.position = "right")
    ggsave(paste(filename, "map.pdf", sep = "-"), width = 8.5, 
        height = 11, units = "in")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
