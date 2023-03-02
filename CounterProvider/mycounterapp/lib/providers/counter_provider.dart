import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counterValue = 0;
  int get counterValue => _counterValue;

  void add() {
    _counterValue++;
    notifyListeners();
  }

  void remove() {
    if (_counterValue != 0) _counterValue--;
    notifyListeners();
  }
}
