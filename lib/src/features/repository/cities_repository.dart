import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/src/common/constants/confity.dart';
import 'package:weather_app/src/common/services/wrapper/i_services.dart';

import '../../common/constants/api_const.dart';
import '../../common/models/main_model.dart';

abstract interface class ICitiesRepository {
  abstract final CitiesServices citiesServices;

  Future<BaseModel> getCities(String query);

  Future<BaseModel> getCitiesPosition(double lat, double lon);
}

class CitiesRepository implements ICitiesRepository {
  CitiesRepository() : citiesServices = CitiesServices(dio: dio);

  static final dio = Dio(
    BaseOptions(
      baseUrl: ApiConf.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );

  @override
  final CitiesServices citiesServices;

  @override
  Future<BaseModel> getCities(String query) async {
    String response = await citiesServices.request(
      ApiConst.allPath,
      queryParameters: ApiConst.getCiti(query),
    );
    return BaseModel.fromJson(jsonDecode(response));
  }

  @override
  Future<BaseModel> getCitiesPosition(double lat, double lon) async {
    String response = await citiesServices.request(
      ApiConst.allPath,
      queryParameters: ApiConst.getCitiPosition(lat, lon),
    );
    return BaseModel.fromJson(jsonDecode(response));
  }
}
