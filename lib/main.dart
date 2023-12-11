import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/common/widget/app.dart';
late final SharedPreferences $storage;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  $storage = await SharedPreferences.getInstance();
  await Geolocator.requestPermission();
  runApp(const App());
}
