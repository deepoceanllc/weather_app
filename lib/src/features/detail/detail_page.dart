import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/features/home/widgets/weather_status_widget.dart';
import 'package:weather_app/src/features/settings/settings_page.dart';
import 'package:weather_app/src/features/widgets/custom_weatherwidget.dart';

import '../../common/constants/app_icons.dart';
import '../../common/constants/weather_icons.dart';
import '../home/bloc/weather_bloc.dart';
import '../widgets/custom_text.dart';
import 'widgets/custom_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  late ScrollController controller;
  ValueNotifier<int> focused = ValueNotifier<int>(0);

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 90.h,
        leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
        forceMaterialTransparency: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              icon: Image(
                width: 24.w,
                image: const AssetImage(WeathersIcons.settings),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) => state.map(
          onLoading: (state) => const Center(
            child: CircularProgressIndicator(),
          ),
          onSuccess: (state) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400.r,
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(text: "Today", fondSize: 24),
                                CustomText(
                                  text: DateTime.now().toShort(),
                                  fondSize: 18,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.r),
                          ],
                        ),
                        SizedBox(
                          height: 190.w,
                          child: ValueListenableBuilder<int>(
                              valueListenable: focused,
                              builder: (context, value, child) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    final temp = state.baseModel.list[index];
                                    return CustomButton(
                                      isTapped: value == index,
                                      onTap: () {
                                        focused.value = index;
                                      },
                                      text: temp.main.temp.round().toString(),
                                      clock: temp.dtTxt
                                          .toString()
                                          .substring(11, 13),
                                      path: temp
                                          .weather.first.main.weatherToIconPath,
                                    );
                                  },
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              fondSize: 24,
                              text: "Next Forecast",
                            ),
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
                              thumbColor:
                                  MaterialStateProperty.all(Colors.white),
                              trackBorderColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: Scrollbar(
                              controller: controller,
                              child: BlocBuilder<WeatherBloc, WeatherState>(
                                builder: (context, state) {
                                  state = state as SuccessState;
                                  final day = state.baseModel.getDay();
                                  return ListView.builder(
                                    controller: controller,
                                    itemCount: day.length,
                                    itemBuilder: (context, index) {
                                      final witherMini = day.elementAt(index);
                                      return ScrollButton(
                                        path: witherMini.mini.weatherToIconPath,
                                        text2: witherMini.dateTime.toShort(),
                                        text1:
                                            witherMini.temp.round().toString(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.r),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image(
                                image: const AssetImage(WeathersIcons.sun),
                                width: 24.r,
                              ),
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
              ),
            ),
          ),
          onError: (state) => Center(
            child: Text(state.message),
          ),
        ),
      ),
    );
  }
}

extension GetIconPath on String {
  String get weatherToIconPath => switch (this) {
        "Clouds" => WeathersIcons.cloud,
        "Snow" => WeathersIcons.snow,
        "Clear" => WeathersIcons.clear,
        "Rain" => WeathersIcons.rain,
        _ => "",
      };
}
