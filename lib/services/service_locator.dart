import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_task/services/weather_services.dart';
import 'package:weather_task/utils/api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
Dio setUpDio(){
    final dio = Dio();
     dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
    return  dio;
  }

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(setUpDio()),
  );
  getIt.registerLazySingleton<WeatherService>(
    () => WeatherService(apiService:getIt<ApiService>()),
  );
  
  
  
}
