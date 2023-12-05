import 'package:flutter/material.dart';
import 'package:weather_app/src/common/models/main_model.dart';
import 'package:weather_app/src/features/home/widgets/home_footer_button.dart';
import 'package:weather_app/src/features/home/widgets/home_top_widget.dart';
import 'package:weather_app/src/features/home/widgets/weather_icon_widget.dart';
import 'package:weather_app/src/features/home/widgets/weather_status_widget.dart';
import 'package:weather_app/src/features/repository/cities_repository.dart';
import 'package:weather_app/src/features/widgets/app_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late CitiesRepository repository;
  BaseModel? baseModel;

  @override
  void initState() {
    repository = CitiesRepository();
    getCitiess();
    super.initState();
  }

  void getCitiess() async {
    baseModel = await repository.getCities("London");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: const Column(
                children: [
                  HomeTopWidget(),
                  Expanded(flex: 4, child: WeatherIconWidget()),
                  Expanded(flex: 3, child: WeatherStatusWidget()),
                  Expanded(child: HomeFooterButton()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
