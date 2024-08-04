import 'package:flutter/material.dart';
import 'package:weather_task/constants/cons.dart';
import 'package:weather_task/models/grid_items_value.dart';
import 'package:weather_task/widgets/custom_grid_item.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
    required this.gridItems,
  });
  final GridItemsValue gridItems;

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<String> items = [];
  @override
  void initState() {
    super.initState();
    items = widget.gridItems.getGridItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 1.125,
          crossAxisSpacing: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => CustomGridItem(
          item: customGridItemModel[index],
          value: items[index],
        ),
      ),
    );
  }
}
