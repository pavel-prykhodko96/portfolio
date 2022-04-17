import 'package:flutter/material.dart';
import 'package:relax_button/button_box_animation_delegate.dart';
import 'package:relax_button/constants/keywords.dart';
import 'package:rive/rive.dart';

class HomeScreenController {
  ButtonBoxAnimationDelegate? _buttonBoxAnimationDelegate;

  // TODO: to be extendeed with changing background color, playing sounds etc.
  initButtonBoxAnimationDelegate(Artboard artboard) {
    _buttonBoxAnimationDelegate = ButtonBoxAnimationDelegate(artboard);
  }

  press() {
    _buttonBoxAnimationDelegate?.press();
  }

  unpress() {
    _buttonBoxAnimationDelegate?.unpress();
  }

  exit() {
    _buttonBoxAnimationDelegate?.exit();
  }

  HomeScreenController() {}
}
