import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/widgets/custom_text.dart';

import '../../common/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final String clock;
  final String path;
  final void Function() onTap;
  final bool isTapped;

  const CustomButton({
    required this.path,
    required this.text,
    required this.clock,
    required this.onTap,
    required this.isTapped,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.isTapped ? const Color(0x33FFFFFF) : null,
            border: widget.isTapped
                ? Border.all(color: AppColors.white, width: 2)
                : null,
            borderRadius: widget.isTapped
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
                  image: AssetImage(widget.path),
                  width: 34.w,
                  height: 34.r,
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
