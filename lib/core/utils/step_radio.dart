import 'package:flutter/material.dart';

class RadioStep extends ChangeNotifier {
  int _selectedStep = 0;

  int get selectedStep => _selectedStep;

  void selectStep(int index) {
    _selectedStep = index;
    notifyListeners();
  }
}
