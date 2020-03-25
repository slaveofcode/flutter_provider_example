import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isRed = true;
  bool get isRed => _isRed;

  set setToRed(bool val) {
    _isRed = val;
    notifyListeners();
  }

  Color get activeColor => _isRed ? Colors.red : Colors.green;
}