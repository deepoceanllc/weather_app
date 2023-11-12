import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'src/common/widget/app.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const App());
}
