import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:weather_task/utils/app_styles.dart';

InputDecoration textFieldDecoration() {
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
      onPressed: () {},
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
