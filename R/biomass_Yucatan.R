
biomass_Yucatan=function(z){
  zq70=stats::quantile(z, 0.7)
  return((zq70*0.69086+1.56612)^2)
}
