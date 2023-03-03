import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int counter = 120;
  void increase() {
    counter = counter + 1;
    notifyListeners();
  }
}
