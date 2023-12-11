part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent with _WeatherEventPatternMatcher {}

class GetData extends WeatherEvent {
  @override
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCity event) onGetCity,
    required T Function(RefreshData event) onRefreshData,
  }) =>
      onGetData(this);
}

class GetCity extends WeatherEvent {
  final PointModel point;
  final bool isNew;

  GetCity({
    required this.point,
    this.isNew = false,
  });

  @override
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCity event) onGetCity,
    required T Function(RefreshData event) onRefreshData,
  }) =>
      onGetCity(this);
}

class RefreshData extends WeatherEvent {
  @override
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCity event) onGetCity,
    required T Function(RefreshData event) onRefreshData,
  }) =>
      onRefreshData(this);
}

mixin _WeatherEventPatternMatcher {
  T map<T>({
    required T Function(GetData event) onGetData,
    required T Function(GetCity event) onGetCity,
    required T Function(RefreshData event) onRefreshData,
  });
}
