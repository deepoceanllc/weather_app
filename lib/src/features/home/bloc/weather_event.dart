part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent with _WeatherEventPatternMatcher {}

class GetData extends WeatherEvent {
  @override
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCiti event) onGetCiti,
  }) =>
      onGetData(this);
}

class GetCiti extends WeatherEvent {
  final PointModel point;
  final bool isNew;

  GetCiti({
    required this.point,
    this.isNew = false,
  });

  @override
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCiti event) onGetCiti,
  }) => onGetCiti(this);
}

mixin _WeatherEventPatternMatcher {
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCiti event) onGetCiti,
  });
}
