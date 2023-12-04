import 'package:weather_app/src/common/constants/confity.dart';

abstract class ApiConst {

  static String allPath = "${ApiConf.baseUrl}/data/2.5/forecast?q=Russia&apiKey=54f84fa37b60aca8dbf83cf8a57b6bab";

  static Map<String, String> geoParams(String apiKey) => {
    'apiKey': apiKey,
  };
}