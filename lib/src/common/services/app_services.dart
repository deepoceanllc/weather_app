
import 'package:dio/dio.dart';
import 'package:weather_app/src/common/constants/api_const.dart';
import 'package:weather_app/src/common/constants/confity.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

class AppServices {
  final Dio dio;

  AppServices._(this.dio);

  static AppServices _instance(Dio dio) => AppServices._(dio);

  factory   AppServices(Dio dio) => _instance(dio);

  Future<String> request(
    String path, {
    Method method = Method.get,
    Map<String, String>? headers,
    Map<String, Object>? queryParameters,
    Object? body,
  }) async {
    if (headers != null) dio.options.headers.addAll(headers);
    queryParameters = (queryParameters == null) ? ApiConst.baseQuery() : queryParameters..addAll(ApiConst.baseQuery());
    try {
      Response<String> response = await switch (method) {
        Method.get =>
          dio.get<String>(path, queryParameters: queryParameters, data: body),
        Method.post =>
          dio.post<String>(path, queryParameters: queryParameters, data: body),
        Method.put =>
          dio.put<String>(path, queryParameters: queryParameters, data: body),
        Method.patch =>
          dio.patch<String>(path, queryParameters: queryParameters, data: body),
        Method.delete =>
          dio.delete(path, queryParameters: queryParameters, data: body),
      };

      return switch (response.statusCode) {
        null => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 100 && < 200 => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 200 && < 300 => response.data ?? '',
        >= 300 && < 400 => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 400 && < 500 => Error.throwWithStackTrace(
            ClientException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        >= 500 && < 600 => Error.throwWithStackTrace(
            ServerException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
        _ => Error.throwWithStackTrace(
            UnknownException(response.statusMessage!, response.statusCode!),
            StackTrace.current,
          ),
      };
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }
}

class UnknownException implements Exception {
  final String message;
  final int statusCode;

  UnknownException(
    this.message,
    this.statusCode,
  );
}

class ClientException implements Exception {
  final String message;
  final int statusCode;

  ClientException(this.message, this.statusCode);
}

class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException(
    this.message,
    this.statusCode,
  );
}
