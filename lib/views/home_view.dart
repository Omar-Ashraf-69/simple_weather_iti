import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/managers/weather_provider.dart';
import 'package:weather_task/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home_view';
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        if (weatherProvider.weather == null) {
          if (weatherProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(weatherProvider.errorMessage));
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return HomeViewBody(weather: weatherProvider.weather!);
        }
      },
    );
  }
}
