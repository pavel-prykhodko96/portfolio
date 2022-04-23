import 'dart:math';

import 'package:flutter/material.dart';

class ColorModel with ChangeNotifier {
  Color _backgroundColor;
  Color _textColor = Colors.black.withOpacity(0.65);
  final Color _logoColor = Colors.black;

  Color get backgroundColor => _backgroundColor;
  Color get textColor => _textColor;
  Color get logoColor => _logoColor;

  // TODO: init with value from persistance instead of runtime
  ColorModel(Color backgroundColor) : _backgroundColor = backgroundColor;

  void changeBackgroundColorRandomly() {
    // Generates light colors
    final random = Random();

    const alpha = 255;
    final red = 210 + random.nextInt(46);
    final green = 210 + random.nextInt(46);
    final blue = 210 + random.nextInt(46);
    _backgroundColor = Color.fromARGB(alpha, red, green, blue);
    _textColor = Color.fromARGB(alpha, red - 160, green - 160, blue - 160);

    notifyListeners();
  }
}
