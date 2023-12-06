import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/features/widgets/custom_text.dart';

import '../bloc/weather_bloc.dart';

class WeatherStatusWidget extends StatelessWidget {
  const WeatherStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        state = state as SuccessState;
        return GlassContainer(
          height: double.infinity,
          width: double.infinity,
          elevation: 20,
          color: AppColors.white30,
          borderColor: AppColors.white,
          borderWidth: 2,
          padding: const EdgeInsets.all(20),
          borderGradient: const LinearGradient(
            colors: [
              AppColors.white,
              AppColors.white30,
            ],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                fondSize: 15.sp,
                text: DateTime.now().getDay(),
              ),
              CustomText(
                text: "${state.baseModel.list.first.main.temp.round()}°",
                fondSize: 50.sp,
              ),
              CustomText(
                fondSize: 18.sp,
                text: state.baseModel.list.first.weather.first.main,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(fondSize: 12.sp, text: "Wind"),
                  Container(
                    height: 10,
                    width: 2,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-3, 2),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: CustomText(
                      fondSize: 12.sp,
                      text:
                          "${(state.baseModel.list.first.wind.speed * 3.6).round()} km/h",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(fondSize: 12.sp, text: "Hum "),
                  Container(
                    height: 10,
                    width: 2,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-3, 2),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: CustomText(
                      fondSize: 12.sp,
                      text: "${state.baseModel.list.first.main.humidity} %",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

extension DataExtension on DateTime {
  String getMonth() {
    return switch (month) {
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "Juli",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December",
      _ => "",
    };
  }

  String toShort() {
    return "${getMonth().substring(0, 3)}, $day";
  }

  String getDay() {
    return "Today, $day ${getMonth()}";
  }
}
