# Web Mercator (espg:3857) <<==>> WGS84 (espg:4326)
# from http://www.gal-systems.com/2011/07/convert-coordinates-between-web.html
class GeoConvertion
  def self.ToWGS84(lon,lat)
      raise("Invalide value")if lon.abs < 180 && lat.abs < 90
      raise("Invalide value")if lon.abs > 20037508.3427892 || lon.abs > 20037508.3427892
      num3 = lon / 6378137.0
      num4 = num3 * 57.295779513082323
      num5 = ((num4 + 180.0) / 360.0).floor
      num6 = num4 - (num5 * 360.0)
      num7 = 1.5707963267948966 - (2.0 * Math.atan(Math.exp((-1.0 * lat) / 6378137.0)))
      wlon = num6
      wlat = num7 * 57.295779513082323
      [wlon,wlat]
  end
  
  def self.ToMercator(lon, lat)
      raise("Invalide value") if lon.abs > 180 || lat.abs > 90
      num = lon * 0.017453292519943295
      x = 6378137.0 * num
      a = lat * 0.017453292519943295
      mlon = x
      mlat = 3189068.5 * Math.log((1.0 + Math.sin(a)) / (1.0 - Math.sin(a)))
      [mlon,mlat]
  end
end