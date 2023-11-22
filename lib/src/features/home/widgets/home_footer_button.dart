import 'package:flutter/material.dart';
import 'package:weather_app/src/common/routes/app_routes.dart';

class HomeFooterButton extends StatelessWidget {
  const HomeFooterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.details);
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
