import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fondSize;
  final Color? color;

  const CustomText({
    this.color,
    required this.fondSize,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? AppColors.white,
          fontSize: fondSize.sp,
          shadows: const [
            Shadow(
              color: Colors.black26,
              offset: Offset(-3, 2),
              blurRadius: 2.0,
            ),
          ]),
    );
  }
}
