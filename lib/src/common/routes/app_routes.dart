import 'package:flutter/material.dart';
import 'package:weather_app/src/features/detail/detail_page.dart';
import 'package:weather_app/src/features/home/home_page.dart';
import 'package:weather_app/src/features/map/map_screen.dart';

abstract final class AppRoute {
  static const home = "/";
  static const details = "/details";
  static const map = "/map";

  static Map<String, Widget Function(BuildContext context)> get routes => {
        home: (context) => const HomePage(),
        details: (context) => const DetailPage(),
        map: (context) => const MapScreen(),
      };
}
