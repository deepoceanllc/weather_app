import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/features/home/widgets/location_item_widget.dart';

class HomeTopWidget extends StatefulWidget {
  const HomeTopWidget({super.key});

  @override
  State<HomeTopWidget> createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
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
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 160),
        child: PopupMenuButton(
          elevation: 1,
          constraints: const BoxConstraints.expand(
            width: 160,
            height: 200,
          ),
          surfaceTintColor: Colors.transparent,
          position: PopupMenuPosition.under,
          color: Colors.transparent,
          itemBuilder: (context) => List.generate(
            items.length + 1,
            (index) {
              if (index == items.length) {
                return PopupMenuItem(
                  onTap: () {},
                  child: const LocationItemWidget(
                    location: "Add new location",
                  ),
                );
              }
              final data = items.elementAt(index);
              return PopupMenuItem(
                onTap: () => setState(() {
                  value = data;
                }),
                child: LocationItemWidget(location: data),
              );
            },
          ),
          icon: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  "assets/icons/location.svg",
                  width: 24,
                  height: 24,
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.white,
                      size: 15,
                    ),
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
