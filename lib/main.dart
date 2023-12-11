import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'src/common/widget/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  runApp(const App());
}
