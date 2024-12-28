import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    loadThemeFromPreferences();
  }

  void changeTheme(ThemeMode newTheme) async{
    if(newTheme == appTheme){
      return;
    }
    appTheme = newTheme;
    notifyListeners();
    await saveThemeToPreferences(newTheme);
  }

  saveThemeToPreferences(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', theme.index);
  }


  loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeMode') ?? 0;
    appTheme = ThemeMode.values[themeIndex];
    notifyListeners();
  }
}