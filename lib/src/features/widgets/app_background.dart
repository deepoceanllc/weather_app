import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
      child: SafeArea(
        child: child,
      ),
    );
  }
}
