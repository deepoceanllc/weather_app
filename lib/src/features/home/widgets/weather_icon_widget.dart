import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/detail/detail_page.dart';

import '../bloc/weather_bloc.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            state = state as SuccessState;
            return Image(
              image: AssetImage(state
                  .baseModel.list.first.weather.first.main.weatherToIconPath),
            );
          },
        ),
      ),
    );
  }
}
