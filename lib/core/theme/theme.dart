import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/constants/constants.dart';

class AppTheme {
  static final lightTheme = ThemeData();
  static final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    fontFamilyFallback: [AppConstants.notoSerif, AppConstants.poppins],
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
  );
}
