import 'package:flutter/material.dart';

class AppColors {
  AppColors._privateConstructor();
  static final AppColors _instance = AppColors._privateConstructor();
  factory AppColors() {
    return _instance;
  }

  static const appColor = Color(0xff004566);
  static const Color defaultDateColor = Colors.black;
  static const Color defaultDayColor = Colors.black;
  static const Color defaultMonthColor = Colors.black;
  static const Color defaultSelectionColor = Color(0x30000000);
  static const Color defaultDeactivatedColor = Color(0xFF666666);
}
