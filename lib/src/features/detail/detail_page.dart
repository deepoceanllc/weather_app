import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/features/widgets/custom_weatherwidget.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/constants/weather_icons.dart';
import '../widgets/custom_text.dart';
import 'widgets/custom_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90.h,
        leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 100.w,
              height: 70.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.upBack,
                    width: 32.r,
                    height: 32.r,
                  ),
                  const CustomText(
                    fondSize: 24,
                    text: "Back",
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.blue1,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: Image(
                width: 24.w,
                image: const AssetImage(WeathersIcons.settings),
              ),
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.blue1,
              AppColors.blue2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 10.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Today", fondSize: 24),
                      CustomText(text: "Sep, 12", fondSize: 18),
                    ],
                  ),
                  SizedBox(height: 35.h),
                ],
              ),
              SizedBox(
                height: 190.w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                    CustomButton(
                        text: "24", clock: "13", path: WeathersIcons.sunCloudy),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(fondSize: 24, text: "Next Forecast"),
                  Image(
                    image: const AssetImage(AppIcons.calendar),
                    width: 24.r,
                    height: 24.r,
                  ),
                ],
              ),
              SizedBox(height: 20.r),
              SizedBox(
                height: 250.h,
                width: 308.w,
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.white),
                    trackBorderColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Scrollbar(
                    controller: controller,
                    child: ListView(
                      controller: controller,
                      children: const [
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                        ScrollButton(
                          path: WeathersIcons.sunny,
                          text2: "Sep, 15",
                          text1: "34",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.r),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(image: const AssetImage(WeathersIcons.sun), width: 24.r),
                    const CustomText(
                      fondSize: 18,
                      text: "AccuWeather",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
