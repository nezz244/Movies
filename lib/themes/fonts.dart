import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/colors.dart';

class AppFonts {
  static const String fontFamily = 'Roboto';
  static const String starWars = 'StarWars';

  static const TextStyle starWarsCrawl = TextStyle(
    fontFamily: starWars,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.starWarsYellow,
  );

  static TextStyle titleStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle subtitleStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );

  static TextStyle castStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: AppColors.black,
  );

  static TextStyle movieName = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: AppColors.black,
  );

  static TextStyle overviewStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

}
