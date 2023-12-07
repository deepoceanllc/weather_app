import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/common/routes/app_routes.dart';

import '../../features/home/bloc/weather_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: "Overpass",
          ),
          routes: AppRoute.routes,
          builder: (context, child) => BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc()..add(GetData()),
            child: child,
          ),
        );
      },
    );
  }
}
