import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/common/constants/weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static const items = <String>[
    'Uzbekistan',
    'Samarqand',
    'Jizzax',
    'Rossiya',
    'Amerika',
  ];

  String value = items[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        forceMaterialTransparency: true,
        titleSpacing: 10,
        toolbarHeight: 80,
        title: PopupMenuButton(
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          position: PopupMenuPosition.under,
          color: Colors.transparent,
          itemBuilder: (context) => List.generate(items.length + 1, (index) {
            if (index == items.length) {
              return PopupMenuItem(
                onTap: () {},
                child: const ListTile(
                  title: Text("Add new location"),
                ),
              );
            }
            final data = items.elementAt(index);
            return PopupMenuItem(
              onTap: () => setState(() {
                value = data;
              }),
              child: ListTile(
                title: Text(data),
              ),
            );
          }),
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/location.svg",
                width: 24.w,
                height: 24.h,
              ),
              const SizedBox(width: 15),
              Text(value),
              const SizedBox(width: 15),
              const Icon(CupertinoIcons.chevron_down,
                  color: AppColors.white, size: 15),
            ],
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset(AppIcons.settings),
        //   ),
        //   const SizedBox(width: 10),
        // ],
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 2,
                child: SizedBox.expand(
                  child: Image(
                    width: 40.r,
                    height: 40.r,
                    image: const AssetImage(WeathersIcons.cloudy),
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: Card(

                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
