import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {

  static late SharedPreferences _sharedPreferences;

  bool _isGreen = true;

  bool get isGreen => _isGreen;

  ThemeData get themeColor => _isGreen ? green : red;

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPref(_isGreen);
    notifyListeners();
  }

  Future<void> createSharedPreferencesObject() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value){
    _sharedPreferences.setBool("ThemeData", value);
  }

  Future<void> getSharedPreferencesObject() async {
    _isGreen = _sharedPreferences.getBool("ThemeData") ?? true;
  }

}

