import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/home/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/widgets/app_background.dart';

import '../../common/constants/app_colors.dart';
import '../../common/widget/theme_bloc/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const CupertinoNavigationBarBackButton(
          color: AppColors.white,
        ),
        leadingWidth: 30.r,
        titleSpacing: 1,
        title: const Text("Back",style: TextStyle(color: AppColors.white),),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
          ),
        ),
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: Column(
                children: [
                  SizedBox(height: 20.r),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      state = state as SuccessThemeState;
                      return SwitchListTile(
                        value: state.isDark,
                        title: const Text("Dark Theme",style: TextStyle(color: AppColors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          side: const BorderSide(color: AppColors.white),
                        ),
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(ChangeThemeEvent(value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10.r),
                  ListTile(
                    onTap: () {},
                    title: const Text("Language",style: TextStyle(color: AppColors.white),),
                    trailing: Icon(Icons.language, size: 30.r,color: AppColors.white,),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
