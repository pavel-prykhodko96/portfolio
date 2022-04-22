import 'package:flutter/material.dart';

class BackgroundColorModel with ChangeNotifier {
  Color _color;
  Color get color => _color;

  // TODO: init with value from persistance instead of runtime
  BackgroundColorModel(Color color) : _color = color;

  void changeColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}
