part of 'weather_bloc.dart';

@immutable
abstract class WeatherState with _WeatherStatePatternMatcher {}

class LoadingState extends WeatherState {
  @override
  T map<T>({
    required T Function(LoadingState state) onLoading,
    required T Function(SuccessState state) onSuccess,
    required T Function(ErrorState state) onError,
  }) =>
      onLoading(this);
}

class SuccessState extends WeatherState {
  final BaseModel baseModel;
  SuccessState(this.baseModel);

  @override
  T map<T>({
    required T Function(LoadingState state) onLoading,
    required T Function(SuccessState state) onSuccess,
    required T Function(ErrorState state) onError,
  }) =>
      onSuccess(this);
}

class ErrorState extends WeatherState {
  final String message;
  ErrorState(this.message);
  @override
  T map<T>({
    required T Function(LoadingState state) onLoading,
    required T Function(SuccessState state) onSuccess,
    required T Function(ErrorState state) onError,
  }) =>
      onError(this);
}

mixin _WeatherStatePatternMatcher {
  T map<T>({
    required T Function(LoadingState state) onLoading,
    required T Function(SuccessState state) onSuccess,
    required T Function(ErrorState state) onError,
  });
}
