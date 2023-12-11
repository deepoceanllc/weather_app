import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/common/routes/app_routes.dart';

class HomeFooterButton extends StatelessWidget {
  const HomeFooterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          foregroundColor: AppColors.searchColor,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.details);
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Forecast report",
              style: TextStyle(
                color: AppColors.darkBlue1,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.searchColor,
            ),
          ],
        ),
      ),
    );
  }
}
