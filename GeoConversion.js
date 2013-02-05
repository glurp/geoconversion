// Web Mercator (espg:3857) <<==>> WGS84 (espg:4326)
// from http://www.gal-systems.com/2011/07/convert-coordinates-between-web.html
function ToWGS84(lon,lat)
{
    if (Math.abs(lon) < 180 && Math.abs(lat) < 90)
        return([lon,lat]);

    if ((Math.abs(lon) > 20037508.3427892) || (Math.abs(lat) > 20037508.3427892))
        return([lon,lat]);

    var x = lon;
    var y = lat;
    var num3 = x / 6378137.0;
    var num4 = num3 * 57.295779513082323;
    var num5 = Math.floor((num4 + 180.0) / 360.0);
    var num6 = num4 - (num5 * 360.0);
    var num7 = 1.5707963267948966 - (2.0 * Math.atan(Math.exp((-1.0 * y) / 6378137.0)));
    var wlon = num6;
    var wlat = num7 * 57.295779513082323;
    return([wlon,wlat]);
}

function ToMercator(lon, lat)
{
    if ((Math.abs(lon) > 180 || Math.abs(lat) > 90))
        return([lon,lat]);

    var num = lon * 0.017453292519943295;
    var x = 6378137.0 * num;
    var a = lat * 0.017453292519943295;

    var mlon = x;
    var mlat = 3189068.5 * Math.log((1.0 + Math.sin(a)) / (1.0 - Math.sin(a)));
    return([mlon,mlat]);
}
