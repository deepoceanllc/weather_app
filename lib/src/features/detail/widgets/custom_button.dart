import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/widgets/custom_text.dart';

class ScrollButton extends StatelessWidget {
  final String text1;
  final String path;
  final String text2;

  const ScrollButton({
    Key? key,
    required this.text1,
    required this.path,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.r,right: 25.r),
      child: SizedBox(
        height: 60.h,
        width: 308,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(fondSize: 18, text: text2),
            Image(image: AssetImage(path), width: 50.r, height: 50.r),
            CustomText(fondSize: 18, text: "$text1°"),
          ],
        ),
      ),
    );
  }
}
