import 'package:weather_task/models/custom_grid_item_model.dart';
import 'package:weather_task/utils/assets.dart';

List<CustomGridItemModel> customGridItemModel = [
  CustomGridItemModel(
    image: Assets.iconsFeellike,
    label: "Feels like",
  ),
  CustomGridItemModel(
    image: Assets.iconsHumidity,
    label: "Humidity",
  ),
  CustomGridItemModel(
    image: Assets.iconsVisibility,
    label: "Visibility",
  ),
  CustomGridItemModel(
    image: Assets.iconsWindspeed,
    label: "Wind Speed",
  ),
  CustomGridItemModel(
    image: Assets.iconsSunrise,
    label: "Sun Rise",
  ),
  CustomGridItemModel(
    image: Assets.iconsSunset,
    label: "Sun Set",
  ),


];
