"$JAVA_HOME/bin/javac" -cp jts-1.11.jar GeoConversion.java
java -cp ".;jts-1.11.jar" GeoConversion "france-nord " 2.34984   48.85300
java -cp ".;jts-1.11.jar" GeoConversion "ecosse nord " 2.37      51.029
java -cp ".;jts-1.11.jar" GeoConversion "island      "  -21.9395 64.1302
java -cp ".;jts-1.11.jar" GeoConversion "Cameroun    "  2.0      2.0