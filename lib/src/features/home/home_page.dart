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
  static const items = <String>[
    'Dart',
    'Flutter',
    'Java',
    'Python',
    'Swift'
  ];

  String value = items[1];

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
                  const SizedBox(width: 5),
                  DropdownButton(
                    value: value,
                    onChanged: (value) {
                      if(value == null) {
                        print("added");
                      } else {
                        this.value = value!;
                        setState(() {});
                      }

                    },
                    items: List.generate(items.length + 1, (index) {
                      if(index == items.length) {
                        return const DropdownMenuItem(child: Icon(Icons.add));
                      }
                      final itemValue = items.elementAt(index);
                      return DropdownMenuItem<String>(
                        value: itemValue,
                        child: Text(itemValue),
                      );
                    }),
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
