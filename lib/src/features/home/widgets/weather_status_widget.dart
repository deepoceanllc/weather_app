import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class WeatherStatusWidget extends StatelessWidget {
  const WeatherStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Card(
        elevation: 0,
        color: AppColors.white30,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: AppColors.white,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            // CustomText(
            //   fondSize: 18,
            //   text: "Today, 12 September",
            // ),
            Text(
              "29°",
              style: TextStyle(
                fontSize: 30.sp,
                color: AppColors.white,
                shadows: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
