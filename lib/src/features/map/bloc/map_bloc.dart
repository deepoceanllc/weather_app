import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapLoading()) {
    on<MapEvent>((event, emit) => event.map(
          onGetCities: (event) => _getCities(event, emit),
          onGetStorage: (event) => _getCityStorage(emit),
        ));
  }

  static SharedPreferences? _storage;

  Future<SharedPreferences> getStorage() async {
    if (_storage != null) {
      return _storage!;
    }
    _storage = await SharedPreferences.getInstance();
    return _storage!;
  }

  Future<List<String>> getLocalCities() async {
    print("dsdsd");
    return (await getStorage()).getStringList('cities') ?? [];
  }

  Future<bool> setCities(List<String> cities) async {
    return (await getStorage()).setStringList('cities', cities);
  }

  Future<void> _getCities(GetCities event, Emitter<MapState> emit) async {
    try {
      emit(MapLoading());
      if (event.text.isEmpty) {
        await _getCityStorage(emit);
      } else {
       final result = await _search(event.text);
       emit(MapSuccess(result));
      }
    } catch (e) {
      emit(MapError(e.toString(), null));
    }
  }

  Future<void> _getCityStorage(Emitter<MapState> emit) async {
    try {
      print("object");
      final cities = await getLocalCities();
      print("-----");
      emit(MapInitial(cities));
    } catch (e) {
      emit(MapError(e.toString(), null));
    }
  }

  Future<List<SearchItem>> _search(String query) async {
    final resultWithSession = YandexSearch.searchByText(
      searchText: query,
      geometry: Geometry.fromBoundingBox(const BoundingBox(
        southWest:
            Point(latitude: 55.76996383933034, longitude: 37.57483142322235),
        northEast:
            Point(latitude: 55.785322774728414, longitude: 37.590924677311705),
      )),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
        geometry: false,
      ),
    );

    final result = await resultWithSession.result;
   return result.items ?? [];
  }
}
