
import com.vividsolutions.jts.geom.Coordinate; // only for class coordinate..

public class GeoConversion {
	public static Coordinate ToWGS84C(Coordinate lonlat) { 
		double [] ret= ToWGS84(lonlat.x,lonlat.y ) ;
		return( new Coordinate(ret[0],ret[1]) ); 
	}
	public static double[] ToWGS84(Coordinate lonlat) { return( ToWGS84(lonlat.x,lonlat.y )); }
	public static double[] ToWGS84(double [] lonlat) { return( ToWGS84(lonlat[0],lonlat[1] )); }
	public static double[] ToWGS84(double lon, double lat)
	{
		double [] ret= {lon , lat};
		
	    if (Math.abs(lon) < 180 && Math.abs(lat) < 90)
	        return(ret);

	    if ((Math.abs(lon) > 20037508.3427892) || (Math.abs(lat) > 20037508.3427892))
	        return(ret);

	    double x = lon;
	    double y = lat;
	    double num3 = x / 6378137.0;
	    double num4 = num3 * 57.295779513082323;
	    double num5 = Math.floor((double)((num4 + 180.0) / 360.0));
	    double num6 = num4 - (num5 * 360.0);
	    double num7 = 1.5707963267948966 - (2.0 * Math.atan(Math.exp((-1.0 * y) / 6378137.0)));
	    ret[0] = num6;
	    ret[1] = num7 * 57.295779513082323;
        return(ret);
	}

	public static Coordinate ToMercatorC(Coordinate lonlat) { 
		double [] ret= ToMercator(lonlat.x,lonlat.y ) ;
		return( new Coordinate(ret[0],ret[1]) ); 
	}
	public static double[] ToMercator(Coordinate lonlat) { return( ToMercator(lonlat.x,lonlat.y )) ; }
	public static double[] ToMercator(double [] lonlat) { return( ToMercator(lonlat[0],lonlat[1] )) ; }
	public static double[] ToMercator(double lon, double lat)
	{
		double [] ret= {lon , lat};
	    if ((Math.abs(lon) > 180 || Math.abs(lat) > 90))
	        return(ret);

	    double num = lon * 0.017453292519943295;
	    double x = 6378137.0 * num;
	    double a = lat * 0.017453292519943295;

	    ret[0] = x;
	    ret[1] = 3189068.5 * Math.log((1.0 + Math.sin(a)) / (1.0 - Math.sin(a)));
        return(ret);
	}
  public static String aller_retour(String slon,String slat) {
    double lon=Double.parseDouble(slon);
    double lat=Double.parseDouble(slat);
    double [] m=ToMercator(lon,lat);
    double [] w=ToWGS84(m[0],m[1]);
    return(""+((lon-w[0])/lon)+" %% / "+((lat-w[1])/lat)+ " %%");
  }
  public static void main(String[] arg) {
    System.out.println(arg[0]+ " : error diff "+ aller_retour(arg[1],arg[2]));
  }
}
