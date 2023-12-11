import 'package:weather_app/src/common/constants/confity.dart';

abstract class ApiConst {
  /// API main path
  static String mainPath = "/data/2.5/forecast";

  /// Base query for authentication
  static Map<String, String> baseQuery() => {
        'apiKey': ApiConf.apiKey,
      };

  /// Get city by query string
  static Map<String, String> getCiti(String query) => {
        'q': query,
        'units': 'metric',
      };

  static Map<String, Object> getCitiPosition(double lat, double lon) => {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      };
}
