import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/widgets/custom_text.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/weather_icons.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final String clock;
  final String path;
  final bool isTapped;

  const CustomButton({
    required this.path,
    required this.text,
    required this.clock,
    this.isTapped = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isTapped = !isTapped;
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isTapped ? const Color(0x33FFFFFF) : null,
            border:
                isTapped ? Border.all(color: AppColors.white, width: 2) : null,
            borderRadius: isTapped
                ? BorderRadius.all(
                    Radius.circular(20.r),
                  )
                : null,
          ),
          child: SizedBox(
            width: 70.w,
            child: Column(
              children: [
                SizedBox(height: 25.r),
                CustomText(fondSize: 18, text: "${widget.text} °C"),
                SizedBox(height: 25.r),
                Image(
                  image: const AssetImage(WeathersIcons.sunCloudy),
                  width: 34.w,
                ),
                SizedBox(height: 25.r),
                CustomText(fondSize: 18, text: "${widget.clock}.00"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}