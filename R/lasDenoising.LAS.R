lasDenoising.LAS <-
function(las, offset=1, ...){
  phigh <- grid_metrics(las, ~quantile(Z, probs = 0.99), ...)
  plow <- grid_metrics(las, ~quantile(Z, probs = 0.01), ...)
  las <- lasmergespatial(las, phigh, "phigh")
  las <- lasmergespatial(las, plow, "plow")
  las <- lasfilter(las, Z<(phigh+offset) & Z>(plow-offset))
  las$phigh <- NULL
  las$plow <- NULL
  return(las)
}
