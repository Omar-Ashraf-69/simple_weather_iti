import 'package:weather_task/models/weather/weather.dart';

class GridItemsValue {
  final WeatherModel weather;
  GridItemsValue({required this.weather});
  List<String> getGridItems() {
    return [
      '${weather.current!.feelslikeC}°C',
      '${weather.current!.humidity}%',
      '121',
      "${weather.current!.windKph!} km/h",
      weather.dayTime.sunRise,
      weather.dayTime.sunSet,
    ];
  }
}
