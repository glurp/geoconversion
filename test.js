// node.js test

function puts(c) { 
 var a=[];
 for (var i=0;i<arguments.length;i++) a.push(arguments[i])
 console.log(a.join(" ")); 
}
function tst_wgs_merc(lon,lat) {
  return(" wgs84:("+lon+"/"+lat+") => ("+ ToMercator(lon,lat).join("/")+")")
}
function tst_merc_wgs(lon,lat) {
  return(" merc:("+lon+"/"+lat+") => ("+ ToWGS84(lon,lat).join("/")+")")
}
function aller_retour(lon,lat) {
  var m=ToMercator(lon,lat);
  var w=ToWGS84(m[0],m[1]);
  return(""+((lon-w[0])/lon)+" %% / "+((lat-w[1])/lat)+ " %%");
}
var fs          = require('fs');
eval(fs.readFileSync("./GeoConversion.js","utf-8"))


puts("paris : wgs84 => mercator :" + tst_wgs_merc(2.34984,48.85300));
puts("paris : mercator => wgs84 :" + tst_merc_wgs(261582.99224566596,6249955.278521482));
puts ("notre dame         : error diff "+ aller_retour(2.34984,48.85300) );
puts ("nord pas de calais : error diff "+ aller_retour(2.37,51.029));
puts ("pyrenee            : error diff "+ aller_retour(2.86320,42.46));
puts ("pyrenee            : error diff "+  aller_retour(-21.9395,64.1302));
puts ("epoch              : error diff "+  aller_retour(2.0,2.0));