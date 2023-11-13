import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blue1,
                AppColors.blue2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [.5,.5],
            ),
          ),
        ),
      ),
    );
  }
}
