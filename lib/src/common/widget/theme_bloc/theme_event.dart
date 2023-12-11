part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent with _ThemeEventPatternMatcher {}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDark;

  ChangeThemeEvent(this.isDark);

  @override
  T map<T>({
    required T Function(ChangeThemeEvent event) onChange,
    required T Function(GetThemeEvent event) onGetChange,
  }) {
    return onChange(this);
  }
}

class GetThemeEvent extends ThemeEvent {
  GetThemeEvent();

  @override
  T map<T>({
    required T Function(ChangeThemeEvent event) onChange,
    required T Function(GetThemeEvent event) onGetChange,
  }) {
    return onGetChange(this);
  }
}

mixin _ThemeEventPatternMatcher {
  T map<T>({
    required T Function(ChangeThemeEvent event) onChange,
    required T Function(GetThemeEvent event) onGetChange,
  });
}
