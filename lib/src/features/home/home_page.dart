import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: DecoratedBox(
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
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    width: 20.spMin,
                    height: 20.spMin,
                  ),
                  SizedBox(width: 5),
                  const Text("Samerang"),
                  DropdownButton(
                    onChanged: (value) {
                      value = value;
                      setState(() {});
                    },
                    items: <String>[
                      'Dart',
                      'Flutter',
                      'Java',
                      'Python',
                      'Swift'
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
