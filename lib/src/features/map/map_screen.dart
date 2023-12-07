import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/common/models/main_model.dart';
import 'package:weather_app/src/common/models/point_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../common/constants/app_colors.dart';
import 'bloc/map_bloc.dart';
import 'cubit/search_cubit.dart';
import 'widgets/custom_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final ValueNotifier<bool> isFocused = ValueNotifier<bool>(false);
  final GlobalKey searchKey = GlobalKey();
  late YandexMapController _controller;
  late final MapBloc mapBloc;

  late SearchCubit cubit;

  @override
  void initState() {
    cubit = SearchCubit();
    mapBloc = MapBloc();
    focusNode = FocusNode()..addListener(onFocus);
    controller = TextEditingController()..addListener(onChange);
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    mapBloc.close();
    focusNode
      ..removeListener(onFocus)
      ..dispose();
    controller
      ..removeListener(onChange)
      ..dispose();
    super.dispose();
  }

  void onFocus() {
    isFocused.value = focusNode.hasFocus;
    if (isFocused.value) {
      mapBloc.add(GetFromStorage());
    }
  }

  double getSize() {
    RenderBox? renderBox =
        searchKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 0;
  }

  void onChange() {
    if (controller.text.isEmpty) {
      mapBloc.add(GetFromStorage());
    } else {
      mapBloc.add(GetCities(controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            StreamBuilder<SearchState>(
                stream: cubit.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data is SearchErrorState) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  return YandexMap(
                    mapObjects: data?.markers ?? [],
                    onMapCreated: (controller) {
                      _controller = controller;
                    },
                  );
                }),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 15.r + MediaQuery.of(context).viewPadding.top + getSize(),
              left: 10.r,
              right: 10.r,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isFocused,
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      duration: const Duration(milliseconds: 200),
                      height: value ? 270.h : 0,
                      width: double.infinity,
                      child: BlocBuilder<MapBloc, MapState>(
                        bloc: mapBloc,
                        builder: (context, state) => state.map<Widget>(
                          onLoading: (state) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          onSuccess: (state) {
                            return ListView.builder(
                              itemCount: state.mapItems.length,
                              itemBuilder: (context, index) {
                                final item = state.mapItems[index];
                                return ListTile(
                                  onTap: () async {
                                    cubit.addMarker(item, _controller);
                                    focusNode.unfocus();
                                  },
                                  title: Text(
                                    item.name,
                                  ),
                                  subtitle: Text(
                                    item.toponymMetadata!.balloonPoint.latitude
                                        .toString(),
                                  ),
                                );
                              },
                            );
                          },
                          onError: (state) {
                            return Center(
                              child: Text(state.message),
                            );
                          },
                          onInitial: (state) {
                            return ListView.builder(
                              itemCount: state.mapItems.length,
                              itemBuilder: (context, index) {
                                final item = state.mapItems[index];
                                PointModel weather = PointModel.fromMap(jsonDecode(item));
                                return ListTile(
                                  title: Text(
                                    weather.name,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              top: 10.r,
              right: 10.r,
              left: 10.r,
              child: SafeArea(
                child: CustomSearchBar(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  searchKey: searchKey,
                  controller: controller,
                  focusNode: focusNode,
                ),
              ),
            ),
            Positioned(
              bottom: 25.h,
              left: 50.w,
              right: 50.w,
              child: StreamBuilder<SearchState>(
                  stream: cubit.stream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data is SearchSuccess) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(50.h),
                            elevation: 30,
                            backgroundColor: AppColors.blue2,
                            foregroundColor: AppColors.white),
                        onPressed: () {
                          Navigator.pop(context, data.pointModel);
                        },
                        child: const Text(
                          "Qo'shish",
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
