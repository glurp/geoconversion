require_relative "./geo_conversion.rb"

def tst_wgs_merc(lon,lat) 
  " wgs84:(#{lon}/#{lat}) => #{GeoConvertion.ToMercator(lon,lat).join("/")})"
end
def tst_merc_wgs(lon,lat) 
  " merc:(#{lon}/#{lat}) => (#{ GeoConvertion.ToWGS84(lon,lat).join("/")})"
end
def aller_retour(lon,lat) 
  m=GeoConvertion.ToMercator(lon,lat)
  w=GeoConvertion.ToWGS84(m[0],m[1])
  "#{((lon-w[0])/lon)} %% / #{((lat-w[1])/lat)} %%"
end


puts("paris : wgs84 => mercator :#{tst_wgs_merc(2.34984,48.85300)}")
puts("paris : mercator => wgs84 :#{tst_merc_wgs(261582.99224566596,6249955.278521482)}")
puts("notre dame         : error diff #{aller_retour(2.34984,48.85300)}")
puts("nord pas de calais : error diff #{aller_retour(2.37,51.029)}")
puts("pyrenee            : error diff #{aller_retour(2.86320,42.46)}")
puts("pyrenee            : error diff #{ aller_retour(-21.9395,64.1302)}")
puts("epoch              : error diff #{ aller_retour(2.0,2.0)}")