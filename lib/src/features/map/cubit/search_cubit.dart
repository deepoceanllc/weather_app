import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static const MapObjectId _mapObjectId = MapObjectId('normal_icon_placemark');

  void addMarker(SearchItem item,YandexMapController controller) async {
    try {
      final point = Point(
        latitude: item.toponymMetadata!.balloonPoint.latitude,
        longitude: item.toponymMetadata!.balloonPoint.longitude,
      );
      print('---------------------------------------------------------');
      print(item.toponymMetadata?.address.addressComponents);
      print(item.toponymMetadata?.address.formattedAddress);
      print(item.toponymMetadata?.props);
      print(item.businessMetadata?.props);
      print(item.businessMetadata?.address);
      print(item.businessMetadata?.address.formattedAddress);
      print(item.businessMetadata?.address.addressComponents);



      final mapObject = _createObject(point: point, name: item.name);
      emit(SearchSuccess([mapObject]));
      await _moveAt(point, controller);
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }


  Future<void> _moveAt(Point point,YandexMapController controller) async {
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: point)),
      animation: const MapAnimation(),
    );
  }

  PlacemarkMapObject _createObject({
    required Point point,
    required String name,
  }) {
    return PlacemarkMapObject(
      mapId: _mapObjectId,
      point: point,
      onTap: (PlacemarkMapObject self, Point point) =>
          print('Tapped me at $point'),
      opacity: 0.7,
      direction: 0,
      // isDraggable: false,
      // onDragStart: (_) => print('Drag start'),
      // onDrag: (_, Point point) => print('Drag at point $point'),
      // onDragEnd: (_) => print('Drag end'),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/icons/img.png'),
        ),
      ),
      text: PlacemarkText(
        text: name,
        style: const PlacemarkTextStyle(
          placement: TextStylePlacement.top,
          color: Colors.amber,
          outlineColor: Colors.black,
        ),
      ),
    );
  }
}
