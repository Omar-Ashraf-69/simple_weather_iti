import 'package:weather_task/utils/assets.dart';

String getImage(String condition) {
  return images[condition.toLowerCase()] ?? Assets.imagesCloud;
}

final Map<String, String> images = {
  'cloud': Assets.imagesCloud,
  'hurricane': Assets.imagesHurricane,
  'raining': Assets.imagesRaining,
  'wave': Assets.imagesWave,
  'thunder': Assets.imagesThunder,
};
