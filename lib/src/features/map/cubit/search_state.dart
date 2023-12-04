part of 'search_cubit.dart';

@immutable
abstract class SearchState with _MapPatternMatcherState {
  SearchState([this.markers =  const []]);

  final List<PlacemarkMapObject> markers;
}

class SearchInitial extends SearchState {
  @override
  T map<T>({
    required T Function(SearchInitial state) onInitial,
    required T Function(SearchErrorState state) onError,
    required T Function(SearchSuccess state) onSuccess,
  }) =>
      onInitial(this);
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState(this.message);

  @override
  T map<T>({
    required T Function(SearchInitial state) onInitial,
    required T Function(SearchErrorState state) onError,
    required T Function(SearchSuccess state) onSuccess,
  }) =>
      onError(this);
}

class SearchSuccess extends SearchState {
  SearchSuccess(super.markers);

  @override
  T map<T>({
    required T Function(SearchInitial state) onInitial,
    required T Function(SearchErrorState state) onError,
    required T Function(SearchSuccess state) onSuccess,
  }) =>
      onSuccess(this);
}

mixin _MapPatternMatcherState {
  T map<T>({
    required T Function(SearchInitial state) onInitial,
    required T Function(SearchErrorState state) onError,
    required T Function(SearchSuccess state) onSuccess,
  });
}
