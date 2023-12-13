import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_settings/open_settings.dart';
import 'package:weather_app/src/features/home/bloc/weather_bloc.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.state,
    super.key,
  });

  final ErrorState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        title: Text(
          state.message,
        ),
        actions: [
          CupertinoButton(
            child: Text("Retry" , style: TextStyle(color: Theme.of(context).primaryColor),),
            onPressed: () => context.read<WeatherBloc>().add(RefreshData()),
          ),
          CupertinoButton(
              child: Text("Settings",style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: () async => await OpenSettings.openWIFISetting()),
        ],
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 45.r,
          ),
        ),
      ),
    );
  }
}
