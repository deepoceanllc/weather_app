import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';
import 'package:weather_app/src/common/routes/app_routes.dart';
import 'package:weather_app/src/features/home/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/home/widgets/location_item_widget.dart';

import '../../../common/models/point_model.dart';

class HomeTopWidget extends StatefulWidget {
  const HomeTopWidget({super.key});

  @override
  State<HomeTopWidget> createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 160),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            state = state as SuccessState;
            final items = WeatherBloc.db.getStringList("cities") ?? [];
            PointModel model = PointModel.fromMap(
                jsonDecode(WeatherBloc.db.getString("citi") as String));
            return PopupMenuButton(
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
                      onTap: () async {
                        final point =
                            await Navigator.pushNamed(context, AppRoute.map);
                        if (point != null && mounted) {
                          context.read<WeatherBloc>().add(
                                GetCiti(
                                  point: point as PointModel,
                                  isNew: true,
                                ),
                              );
                        }
                      },
                      child: const LocationItemWidget(
                        location: "Add new location",
                      ),
                    );
                  }
                  PointModel pointModel =
                      PointModel.fromMap(jsonDecode(items.elementAt(index)));
                  return PopupMenuItem(
                    onTap: () {
                      context.read<WeatherBloc>().add(GetCiti(point: pointModel));
                    },
                    child: LocationItemWidget(location: pointModel.name),
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
                        model.name,
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
            );
          },
        ),
      ),
    );
  }
}
