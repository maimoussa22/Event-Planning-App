import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier{
  String appLanguage = 'en';

  AppLanguageProvider(){
    loadLanguage();
  }

  void changeLanguage(String newLanguage)async{
    if(newLanguage == appLanguage){
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    await saveLanguage(newLanguage);
  }

  saveLanguage(String language)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appLanguage', language);
  }
  void loadLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('appLanguage') ?? 'en';
    notifyListeners();
  }
}