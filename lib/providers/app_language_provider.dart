import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';
  AppLanguageProvider() {
    loadLanguage();
  }
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else {
      appLanguage = newLanguage;
      saveLanguage();
      notifyListeners();
    }
  }

  saveLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentLanguage", appLanguage == 'en' ? 'en' : 'ar');
  }

  loadLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString("currentLanguage");
    currentLanguage == 'en' ? appLanguage = 'en' : appLanguage = 'ar';
    notifyListeners();
  }
}
