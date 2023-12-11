part of 'theme_bloc.dart';

@immutable
abstract class ThemeState with _ThemeStatePatternMatcher {}

class ThemeLoadingState extends ThemeState {
  @override
  T map<T>({
    required T Function(SuccessThemeState state) onSuccess,
    required T Function(ThemeLoadingState state) onLoading,
    required T Function(ThemeErrorState state) onError,
  }) => onLoading(this);
}

class SuccessThemeState extends ThemeState {
  final bool isDark;

  SuccessThemeState(this.isDark);

  @override
  T map<T>({
    required T Function(SuccessThemeState state) onSuccess,
    required T Function(ThemeLoadingState state) onLoading,
    required T Function(ThemeErrorState state) onError,
  }) => onSuccess(this);

  ThemeMode getTheme() => isDark ? ThemeMode.dark : ThemeMode.light;

}

class ThemeErrorState extends ThemeState {
  final String message;

  ThemeErrorState(this.message);

  @override
  T map<T>({
    required T Function(SuccessThemeState state) onSuccess,
    required T Function(ThemeLoadingState state) onLoading,
    required T Function(ThemeErrorState state) onError,
  }) => onError(this);
}

mixin _ThemeStatePatternMatcher {
  T map<T>({
    required T Function(SuccessThemeState state) onSuccess,
    required T Function(ThemeLoadingState state) onLoading,
    required T Function(ThemeErrorState state) onError,
  });
}
