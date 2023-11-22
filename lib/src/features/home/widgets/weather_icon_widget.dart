import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/weather_icons.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(WeathersIcons.sunny),
    );
  }
}
