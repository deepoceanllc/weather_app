import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/common/models/main_model.dart';

import '../../repository/cities_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  static late final SharedPreferences db;
  ICitiesRepository repository = CitiesRepository();

  WeatherBloc() : super(LoadingState()) {
    on<WeatherEvent>(
      (event, emit) => event.map(
        onGetData: (event) => _getData(event, emit),
        onGetCiti: (event) => _getCiti(event, emit),
      ),
    );
  }

  Future<void> _getData(GetData event, Emitter<WeatherState> emit) async {
    try {
      final BaseModel citi;
      db = await SharedPreferences.getInstance();
     // db.clear();
      String? res = db.getString("citi");

      if (res == null) {
        Position position = await Geolocator.getCurrentPosition();
        citi = await repository.getCitiesPosition(
            position.latitude, position.longitude);
        await Future.wait([
          db.setString("citi", citi.city.name),
          db.setStringList("cities", [citi.city.name])
        ]);
      } else {
        citi = await repository.getCities(res);
      }
      emit(SuccessState(citi));
    } on DioException catch (e) {
      emit(ErrorState(e.message!));
    }
  }

  Future<void> _getCiti(GetCiti event, Emitter<WeatherState> emit) async {
    final BaseModel baseModel;
    try {
      if (event.isNew) {
        final cities = db.getStringList("cities") ?? [];
        db.setStringList("cities", cities..add(event.query));
      }
      await db.setString("citi", event.query);
      baseModel = await repository.getCities(event.query);
      emit(SuccessState(baseModel));
    } on DioException catch (e) {
      emit(ErrorState(e.message!));
    }
  }
}
