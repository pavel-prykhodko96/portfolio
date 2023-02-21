import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relax_button/constants/colors.dart';
import 'package:relax_button/repositories/preferences.dart';

class ColorsController with ChangeNotifier {
  final Preferences _preferences = Preferences();
  late Color _backgroundColor;
  late Color _textColor;
  final Color _logoColor = RelaxButtonColors.defaultLogo;

  Color get backgroundColor => _backgroundColor;
  Color get textColor => _textColor;
  Color get logoColor => _logoColor;

  ColorsController() {
    _backgroundColor = _preferences.backgroundColor;
    _textColor = _preferences.textColor;
  }

  void changeBackgroundColorRandomly() {
    // Generates light colors
    final random = Random();

    const alpha = 255;
    final red = 210 + random.nextInt(46);
    final green = 210 + random.nextInt(46);
    final blue = 210 + random.nextInt(46);
    _backgroundColor = Color.fromARGB(alpha, red, green, blue);
    _preferences.setBackgroundColor(_backgroundColor);
    _textColor = Color.fromARGB(alpha, red - 160, green - 160, blue - 160);
    _preferences.setTextColor(_textColor);

    notifyListeners();
  }
}
