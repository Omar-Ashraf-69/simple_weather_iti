import 'package:flutter/material.dart';
import 'package:weather_task/constants/featching_data.dart';
import 'package:weather_task/utils/app_styles.dart';
import 'package:weather_task/utils/assets.dart';
import 'package:weather_task/utils/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = "/";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  Future<void> timer() async {
    FeatchingData(
      // ignore: use_build_context_synchronously
      context: context,
    ).fetchWeatherData();
    await Future.delayed(const Duration(seconds: 1), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesHumidity,
              width: MediaQuery.sizeOf(context).width * 0.8,
            ),
            const SizedBox(height: 25),
            Text(
              "Weatherly",
              style: AppStyles.spalshStyle,
            ),
          ],
        ),
      ),
    );
  }
}
