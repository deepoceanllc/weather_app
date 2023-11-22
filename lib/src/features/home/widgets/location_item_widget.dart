import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';

class LocationItemWidget extends StatelessWidget {
  const LocationItemWidget({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        location,
        style: const TextStyle(
          color: AppColors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
