import 'dart:ffi';

import 'package:weather_app/src/common/constants/confity.dart';

abstract class ApiConst {

  static String allPath = "/data/2.5/forecast";



  static Map<String, String> baseQuery() => {
    'apiKey': ApiConf.apiKey,
  };

  static Map<String,String> getCiti(String query) => {
    'q': query,
  };

  static Map<String,Object> getCitiPosition(double lat , double lon) => {
    'lat': lat,
    'lon': lon,
  };

}