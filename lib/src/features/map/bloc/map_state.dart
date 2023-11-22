part of 'map_bloc.dart';

@immutable
abstract class MapState with _MapStatePatternMatcher {}

class MapLoading extends MapState {
  @override
  T map<T>({
    required T Function(MapLoading state) onLoading,
    required T Function(MapSuccess state) onSuccess,
    required T Function(MapError state) onError,
    required T Function(MapInitial state) onInitial,
  }) => onLoading(this);
}

class MapError extends MapState {
  final String message;
  final String? statusCode;

  MapError(this.message, this.statusCode);

  @override
  T map<T>({
    required T Function(MapLoading state) onLoading,
    required T Function(MapSuccess state) onSuccess,
    required T Function(MapError state) onError,
    required T Function(MapInitial state) onInitial,
  }) => onError(this);
}

class MapSuccess extends MapState {
  final List<SearchItem> mapItems;

  MapSuccess(this.mapItems);

  @override
  T map<T>({
    required T Function(MapLoading state) onLoading,
    required T Function(MapSuccess state) onSuccess,
    required T Function(MapError state) onError,
    required T Function(MapInitial state) onInitial,
  }) => onSuccess(this);
}

class MapInitial extends MapState {
  final List<String> mapItems;

  MapInitial(this.mapItems);

  @override
  T map<T>({
    required T Function(MapLoading state) onLoading,
    required T Function(MapSuccess state) onSuccess,
    required T Function(MapError state) onError,
    required T Function(MapInitial state) onInitial,
  }) => onInitial(this);
}

mixin _MapStatePatternMatcher {
  T map<T>({
    required T Function(MapLoading state) onLoading,
    required T Function(MapSuccess state) onSuccess,
    required T Function(MapError state) onError,
    required T Function(MapInitial state) onInitial,
  });
}
