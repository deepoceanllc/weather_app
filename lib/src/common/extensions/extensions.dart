import 'package:dio/dio.dart';

extension DioExtension on DioException {
  String toMessage() => switch (type) {
        DioExceptionType.connectionError => "Check your network connection",
        _ => message ?? "Something went wrong"
      };
}
