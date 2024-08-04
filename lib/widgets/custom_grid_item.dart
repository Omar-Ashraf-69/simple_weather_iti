import 'package:flutter/material.dart';
import 'package:weather_task/models/custom_grid_item_model.dart';
import 'package:weather_task/utils/app_styles.dart';
import 'package:weather_task/utils/colors.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({
    super.key,
    required this.item,
    required this.value,
  });
  final CustomGridItemModel item;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: primaryColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Image.asset(
            item.image,
            height: MediaQuery.sizeOf(context).height * 0.055,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            value,
            style: AppStyles.valueStyle,
          ),
          Text(
            item.label,
            style: AppStyles.cardTitleStyle,
          ),
        ],
      ),
    );
  }
}
