import 'package:flutter/material.dart';
import 'package:weather_task/views/home_view.dart';
import 'package:weather_task/views/splash_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashView.routeName: (context) => const SplashView(),
  HomeView.routeName: (context) => const HomeView(),
};
