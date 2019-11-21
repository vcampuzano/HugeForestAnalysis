
biomass_QuintanaRoo=function(z){
  zq80=stats::quantile(z, 0.8)
  return((zq80*0.6103+0.1418)^2) # Ecuación obtenida con los datos de SMIC FCP
}
