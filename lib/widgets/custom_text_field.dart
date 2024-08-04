// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:weather_task/constants/featching_data.dart';
import 'package:weather_task/utils/app_styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
  });
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: TextField(
        onChanged: (value) {
          controller.text = value;
        },
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        onSubmitted: (value) async {
          await FeatchingData(context: context)
              .fetchWeatherData(cityName: value);
        },
        keyboardType: TextInputType.text,
        decoration: TextFieldDecoration(context),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InputDecoration TextFieldDecoration(BuildContext context) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        borderSide: BorderSide.none,
      ),
      fillColor: Colors.white,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () async {
          if (controller.text.isNotEmpty) {
            await FeatchingData(context: context)
                .fetchWeatherData(cityName: controller.text);
          }
        },
        icon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(IconlyLight.search),
        ),
      ),
      hintText: 'Search City',
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      hintStyle: AppStyles.hintStyle,
    );
  }
}
