import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_task/models/weather/weather.dart';
import 'package:weather_task/utils/api_service.dart';
import 'package:weather_task/utils/errors/failure.dart';

class WeatherService {
  final String baseUrl = "https://api.weatherapi.com/v1/";
  final String key = "95c34eece5564eaabfb165112240308";
  final ApiService apiService;

  WeatherService( { required this.apiService});

//https://api.weatherapi.com/v1/current.json?key=95c34eece5564eaabfb165112240308&q=cairo&aqi=no

  Future<Either<Failure,WeatherModel>> getWeather({ required String cityName}) async {
    try {
      final response = await apiService.get(
        url: "${baseUrl}forecast.json?key=$key&q=$cityName",
        token: '',
      );
      return right( WeatherModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(error: e.toString()));
    }
    
  }
}
