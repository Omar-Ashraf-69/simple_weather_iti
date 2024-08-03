import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_task/utils/colors.dart';

abstract class AppStyles {
  static final TextStyle spalshStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 40,
    fontFamily: GoogleFonts.ropaSans().fontFamily,
  );
  static const TextStyle cityNameStyle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle hintStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: greyColor,
    fontFamily: GoogleFonts.ropaSans().fontFamily,
  );
  static const TextStyle tempStyle = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle conditionStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle valueStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: fontColor,
  );
}
