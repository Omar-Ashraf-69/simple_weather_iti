import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/managers/weather_provider.dart';
import 'package:weather_task/routes.dart';
import 'package:weather_task/services/service_locator.dart';
import 'package:weather_task/services/weather_services.dart';
import 'package:weather_task/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  setupGetIt();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(getIt<WeatherService>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            fontFamily: 'Ubuntu',
          ),
        ),
        initialRoute: SplashView.routeName,
        routes: routes,
      ),
    );
  }
}
