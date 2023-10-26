import 'package:flutter/material.dart';

import '../sherad/sharedPrefs/shared_prefs.dart';




class MyProvider extends ChangeNotifier{
  String Language = "en";
  ThemeMode mode = ThemeMode.light;
  DateTime selectDay= DateTime.now();

  void inti()async{
    String? lang=SharedPrefs.getLang();
    changeLang(lang??"en");
    String? theme = SharedPrefs.getTheme();
    if (theme=="light"){
      changeTheme(ThemeMode.light);
    }
    else{
      changeTheme(ThemeMode.dark);
    }
  }

  void changeLang(String lang){
    Language=lang;
    SharedPrefs.setLang(lang);
    notifyListeners();
  }
  void changeTheme(ThemeMode Mode){
    mode=Mode;
    if (Mode==ThemeMode.light){
      SharedPrefs.setTheme("light");
    }else{
      SharedPrefs.setTheme("dark");
    }
    notifyListeners();
  }
  void changeData(DateTime Data){
    selectDay=Data;
    notifyListeners();
  }
}