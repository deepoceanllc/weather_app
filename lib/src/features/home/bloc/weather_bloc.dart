import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/common/extensions/extensions.dart';
import 'package:weather_app/src/common/models/main_model.dart';
import 'package:weather_app/src/common/models/point_model.dart';
import 'package:weather_app/src/common/repository/cities_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  static const cityKey = "city";
  static const citiesKey = "cities";
  static late final SharedPreferences db;
  ICitiesRepository repository = CitiesRepository();

  WeatherBloc() : super(LoadingState()) {
    on<WeatherEvent>(
      (event, emit) => event.map(
        onGetData: (event) => _getData(event, emit),
        onGetCity: (event) => _getCiti(event, emit),
        onRefreshData: (event) => _getRefreshData(event, emit),
      ),
    );
  }

  Future<void> _getData(
    GetData event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      db = await SharedPreferences.getInstance();
      // db.clear();
      final city = await _getLocationData();
      emit(SuccessState(city));
    } on DioException catch (e) {
      emit(ErrorState(e.toMessage()));
    }
  }

  Future<void> _getCiti(
    GetCity event,
    Emitter<WeatherState> emit,
  ) async {
    final BaseModel baseModel;
    try {
      if (event.isNew) {
        final cities = db.getStringList(citiesKey) ?? [];
        db.setStringList(
          citiesKey,
          cities..add(jsonEncode(event.point.toMap())),
        );
      }
      await db.setString(cityKey, jsonEncode(event.point.toMap()));
      baseModel = await repository.getCitiesPosition(
        event.point.lat,
        event.point.lon,
      );
      emit(SuccessState(baseModel));
    } on DioException catch (e) {
      emit(ErrorState(e.toMessage()));
    }
  }

  Future<void> _getRefreshData(
    RefreshData event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(LoadingState());
      final city = await _getLocationData();
      emit(SuccessState(city));
    } on DioException catch (e) {
      emit(ErrorState(e.toMessage()));
    }
  }

  Future<BaseModel> _getLocationData() async {
    String? res = db.getString(cityKey);
    final BaseModel city;
    if (res == null) {
      Position position = await Geolocator.getCurrentPosition();
      city = await repository.getCitiesPosition(
          position.latitude, position.longitude);
      String point = jsonEncode(
        PointModel(
          lat: position.latitude,
          lon: position.longitude,
          name: city.city.name,
        ).toMap(),
      );
      await Future.wait([
        db.setString(cityKey, point),
        db.setStringList(citiesKey, [point]),
      ]);
    } else {
      PointModel pointModel = PointModel.fromMap(jsonDecode(res));
      city = await repository.getCitiesPosition(pointModel.lat, pointModel.lon);
    }
    return city;
  }
}
