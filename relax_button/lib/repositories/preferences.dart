import 'package:flutter/material.dart';
import 'package:relax_button/constants/colors.dart';
import 'package:relax_button/constants/keywords.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// It should be initialized with Preferences.initialize before getting and setting values to/from a disk.
/// It should be done only once or an error will be thrown.
class Preferences {
  static final Preferences _preferences = Preferences._internal();
  Preferences._internal();

  /// It should be initialized with Preferences.initialize before getting and setting values to/from a disk.
  /// It should be done only once or an error will be thrown.
  factory Preferences() {
    return _preferences;
  }

  static late final SharedPreferences _sharedPreferences;

  /// This method should be called only once before getting and setting values to/from a disk
  static Future<void> initialize() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
    } catch (err) {
      print(
          "Error occured: $err. Did you called Preferences.initialize() more than once?");
    }
  }

  Color get backgroundColor {
    int? storedColorValue =
        _sharedPreferences.getInt(SharedPreferencesKeywords.backgroundColor);
    return storedColorValue != null
        ? Color(storedColorValue)
        : RelaxButtonColors.defaultBackground;
  }

  void setBackgroundColor(Color newColor) => _sharedPreferences.setInt(
        SharedPreferencesKeywords.backgroundColor,
        newColor.value,
      );

  Color get textColor {
    int? storedColorValue =
        _sharedPreferences.getInt(SharedPreferencesKeywords.textColor);
    return storedColorValue != null
        ? Color(storedColorValue)
        : RelaxButtonColors.defaultText;
  }

  void setTextColor(Color newColor) => _sharedPreferences.setInt(
        SharedPreferencesKeywords.textColor,
        newColor.value,
      );
}
