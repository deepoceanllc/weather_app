import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'bloc/map_bloc.dart';
import 'widgets/custom_searchBar.dart';

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
  late final MapBloc mapBloc;

  @override
  void initState() {
    mapBloc = MapBloc();
    focusNode = FocusNode()..addListener(onFocus);
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    mapBloc.close();
    focusNode
      ..removeListener(onFocus)
      ..dispose();
    controller.dispose();
    super.dispose();
  }

  void onFocus() {
    isFocused.value = focusNode.hasFocus;
    if(isFocused.value){
      mapBloc.add(GetFromStorage());
    }
  }

  double getSize() {
    RenderBox? renderBox =
        searchKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const YandexMap(),
            Positioned(
              top: 10.r,
              right: 10.r,
              left: 10.r,
              child: SafeArea(
                child: CustomSearchBar(
                  onTap: () {},
                  onChanged: (value) {
                    if (value!.isEmpty) {
                      mapBloc.add(GetFromStorage());
                    } else {
                      mapBloc.add(GetCities(value));
                    }
                  },
                  searchKey: searchKey,
                  controller: controller,
                  focusNode: focusNode,
                ),
              ),
            ),
            Positioned(
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
                                return ListTile(
                                  title: Text(
                                    item,
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
          ],
        ),
      ),
    );
  }
}
