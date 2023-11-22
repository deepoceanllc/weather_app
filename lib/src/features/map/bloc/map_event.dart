part of 'map_bloc.dart';

@immutable
abstract class MapEvent with _MapEventPatternMatcher {}

class GetCities extends MapEvent {
  final String text;

  GetCities(this.text);

  @override
  T map<T>({
    required T Function(GetCities event) onGetCities,
    required T Function(GetFromStorage event) onGetStorage,
  }) {
    return onGetCities(this);
  }
}

class GetFromStorage extends MapEvent {
  @override
  T map<T>({
    required T Function(GetCities event) onGetCities,
    required T Function(GetFromStorage event) onGetStorage,
  }) {
    return onGetStorage(this);
  }
}

mixin _MapEventPatternMatcher {
  T map<T>({
    required T Function(GetCities event) onGetCities,
    required T Function(GetFromStorage event) onGetStorage,
  });
}
