import 'package:flutter/material.dart';
import 'package:weather_task/constants/get_weather_image.dart';
import 'package:weather_task/models/grid_items_value.dart';
import 'package:weather_task/models/weather/weather.dart';
import 'package:weather_task/utils/app_styles.dart';
import 'package:weather_task/utils/colors.dart';
import 'package:weather_task/widgets/custom_grid_view.dart';
import 'package:weather_task/widgets/custom_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                CustomTextField(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  weather.location.name,
                  style: AppStyles.cityNameStyle,
                ),
                const SizedBox(
                  height: 12,
                ),
                Image.asset(
                  getImage(weather.current!.condition),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 240,
                ),
                Text(
                  weather.current!.tempC.toString(),
                  style: AppStyles.tempStyle,
                ),
                Text(
                  weather.current!.condition,
                  style: AppStyles.conditionStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomGridView(
                  gridItems: GridItemsValue(
                    weather: weather,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
