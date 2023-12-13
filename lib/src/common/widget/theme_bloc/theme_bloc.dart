
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SuccessThemeState($storage.getBool('isDark') ?? false)) {
    on<ThemeEvent>(
      (event, emit) => event.map(
        onChange: (event) => _onChange(event, emit),
        onGetChange: (event) => _onGetChange(event, emit),
      ),
    );
  }

  void _onChange(ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    await $storage.setBool('isDark', event.isDark);
    emit(SuccessThemeState(event.isDark));
  }

  void _onGetChange(GetThemeEvent event, Emitter<ThemeState> emit) {
    final isDark = $storage.getBool('isDark') ?? false;
    emit(SuccessThemeState(isDark));
  }
}
