import 'package:flutter/material.dart';


class ProviderNavigation extends ChangeNotifier{
  int index = 0 ;
  void changePage (int value){
    index=value;
    notifyListeners();
  }
}