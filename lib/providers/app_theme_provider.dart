import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    loadTheme();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    } else {
      appTheme = newTheme;
    }
    saveTheme();
    notifyListeners();
  }

  bool isDarkMode() => appTheme == ThemeMode.dark;

  saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'appTheme', appTheme == ThemeMode.light ? 'light' : 'dark');
  }

  loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString("appTheme");
    theme == 'light' ? appTheme = ThemeMode.light : appTheme = ThemeMode.dark;
    notifyListeners();
  }
}
