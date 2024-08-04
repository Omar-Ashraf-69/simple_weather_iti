import 'package:flutter/material.dart';
import 'package:weather_task/models/weather/weather.dart';
import 'package:weather_task/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weather;
  final WeatherService weatherService;

  String errorMessage = '';
  WeatherProvider(this.weatherService);

  Future<void> getWeather(String cityName) async {
    var result = await weatherService.getWeather(cityName: cityName);
    result.fold(
      (l) => errorMessage = l.error,
      (r) => weather = r,
    );
    notifyListeners();
  }
}
