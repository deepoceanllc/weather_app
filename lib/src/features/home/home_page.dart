import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/common/constants/app_lotties.dart';
import 'package:weather_app/src/features/home/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/home/widgets/custom_dialog.dart';
import 'package:weather_app/src/features/home/widgets/home_footer_button.dart';
import 'package:weather_app/src/features/home/widgets/home_top_widget.dart';
import 'package:weather_app/src/features/home/widgets/weather_icon_widget.dart';
import 'package:weather_app/src/features/home/widgets/weather_status_widget.dart';
import 'package:weather_app/src/features/widgets/app_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) => state.map(
            onLoading: (state) => Center(
              child: Lottie.asset(
                AppLotties.animation,
                width: 200.w,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
            onSuccess: (state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: const Column(
                      children: [
                        HomeTopWidget(),
                        Expanded(flex: 4, child: WeatherIconWidget()),
                        Expanded(flex: 3, child: WeatherStatusWidget()),
                        Expanded(child: HomeFooterButton()),
                      ],
                    ),
                  ),
                ),
              );
            },
            onError: (state) => CustomDialog(state: state),
          ),
        ),
      ),
    );
  }
}
