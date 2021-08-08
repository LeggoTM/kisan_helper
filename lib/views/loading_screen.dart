import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kisan_helper/services/get_weather_state.dart';
import 'package:kisan_helper/views/main_screen.dart';

class LoadingScreen extends StatelessWidget {
  final RxWeatherView? weather = Get.put(RxWeatherView());
  @override
  Widget build(BuildContext context) {
    if (weather == null) {
      return Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white38,
          ),
        ),
      );
    } else {
      return MainScreen();
    }
  }
}
