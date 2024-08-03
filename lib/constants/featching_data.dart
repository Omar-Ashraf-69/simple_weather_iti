import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/managers/weather_provider.dart';
import 'package:weather_task/views/home_view.dart';

class FeatchingData {
  final BuildContext context;
  FeatchingData( {required this.context});
  Future<void> fetchWeatherData({String cityName = 'cairo'}) async {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.errorMessage = '';
    await weatherProvider.getWeather( 
      cityName,
    );

    if (weatherProvider.errorMessage.isEmpty) {
      _navigateToHome();
    } else {
      _showErrorDialog();
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(HomeView.routeName);
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red,
        title: const Text('Error'),
        content: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) =>
              Text(weatherProvider.errorMessage),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await fetchWeatherData();
            },
            child: const Text(
              'Retry',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Exit',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
