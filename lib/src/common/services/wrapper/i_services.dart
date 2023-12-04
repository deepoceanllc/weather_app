import 'package:dio/dio.dart';
import 'package:weather_app/src/common/services/app_services.dart';

abstract interface class IServicesWrapper {
  abstract final Dio dio;
  abstract final AppServices services;

  Future<void> request(
    String path, {
    Method method = Method.get,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Map<String, Object>? body,
  });
}

class CitiesServices implements IServicesWrapper {

  CitiesServices({required this.dio}) : services = AppServices(dio);

  @override
  final Dio dio;

  @override
  final AppServices services;

  @override
  Future<String> request(
    String path, {
    Method method = Method.get,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Map<String, Object>? body,
  }) =>
      services.request(
        path,
        method: method,
        headers: headers,
        queryParameters: queryParameters,
        body: body,
      );

}
