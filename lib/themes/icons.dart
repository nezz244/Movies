import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/colors.dart';
class AppIcons {
  static Widget searchIcon({double size = 24.0, Color color = AppColors.black}) {
    return Icon(
      Icons.search,
      size: size,
      color: color,
    );
  }
  static Widget backIcon({double size = 24.0, Color color = AppColors.grey}) {
    return Icon(
      Icons.info,
      size: size,
      color: color,
    );
  }
}
