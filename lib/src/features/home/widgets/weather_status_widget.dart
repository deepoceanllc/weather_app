import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/features/widgets/custom_text.dart';

class WeatherStatusWidget extends StatelessWidget {
  const WeatherStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            fondSize: 15.sp,
            text: "Today, 12 September",
          ),
          CustomText(
            text: "29°",
            fondSize: 50.sp,
          ),
          CustomText(
            fondSize: 18.sp,
            text: "Cloudy",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              CustomText(fondSize: 12.sp, text: "10 km/h"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(fondSize: 12.sp, text: "Hum"),
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
              CustomText(fondSize: 12.sp, text: "54 %"),
            ],
          ),
        ],
      ),
    );
  }
}
