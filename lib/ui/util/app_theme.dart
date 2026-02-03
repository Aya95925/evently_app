import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
  );
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundDarkBlack,
  );
}
