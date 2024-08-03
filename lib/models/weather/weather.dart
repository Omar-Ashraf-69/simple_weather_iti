import 'package:weather_task/models/weather/day_time.dart';

import 'current.dart';
import 'location.dart';

class WeatherModel {
  final Location location;
  Current? current;
  final DayTime dayTime;

  WeatherModel( { required this.location,required this.dayTime, this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
        dayTime: DayTime.fromJson(json['forecast']),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );
}
