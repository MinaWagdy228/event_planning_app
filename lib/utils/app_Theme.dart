import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryLight),
      primaryColor: AppColors.primaryLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation:0,
          showUnselectedLabels: true,
          unselectedLabelStyle: AppStyles.bold12White,
          selectedLabelStyle: AppStyles.bold12White),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.primaryLight)
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryLight)
      );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation:0,
          showUnselectedLabels: true,
          unselectedLabelStyle: AppStyles.bold12White,
          selectedLabelStyle: AppStyles.bold12White),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.primaryDark)
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryDark)
      );
}
