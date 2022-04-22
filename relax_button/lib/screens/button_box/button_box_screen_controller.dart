import 'dart:math';

import 'package:just_audio/just_audio.dart';
import 'package:relax_button/screens/button_box/button_box_animation_delegate.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:relax_button/models/button_box_screen_model.dart';
import 'package:rive/rive.dart';

class ButtonBoxScreenController {
  // TODO: currently it is here, but is it ok?:
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPressed = false;
  ButtonBoxAnimationDelegate? _buttonBoxAnimationDelegate;

  // bool get isPressed => _isPressed;

  ButtonBoxScreenController() {}

  // TODO: to be extendeed with changing background color, playing sounds etc.
  // TODO: fix it to set the controller only once. Set as final?
  initButtonBoxAnimationDelegate(Artboard artboard) {
    _buttonBoxAnimationDelegate = ButtonBoxAnimationDelegate(artboard);
  }

  void onButtonBoxTapped() {
    // TODO: implement logic to choose if here should be a press or not.
    _press();
  }

  void _press() {
    // TODO: refactor condition and selecting random value?
    if (_buttonBoxAnimationDelegate != null && !_isPressed) {
      _isPressed = true;
      final randomInt = Random()
          .nextInt(ButtonBoxScreenModel.possibleSoundsAssetsPaths.length);
      _audioPlayer
          .setAsset(ButtonBoxScreenModel.possibleSoundsAssetsPaths[randomInt])
          .then((assetDuration) {
        _audioPlayer.play();

        var unpressDelayDuration = ButtonBoxAnimationDelegate.pressingDuration;
        if (assetDuration != null &&
            assetDuration > ButtonBoxAnimationDelegate.unpressiingDuration) {
          unpressDelayDuration +=
              assetDuration - ButtonBoxAnimationDelegate.unpressiingDuration;
        }

        Future.delayed(unpressDelayDuration, () => _unpress());
      });

      _buttonBoxAnimationDelegate!.press();
    }
  }

  void _unpress() {
    print("trying to unpress...");
    if (_buttonBoxAnimationDelegate != null && _isPressed) {
      _buttonBoxAnimationDelegate?.unpress();
      Future.delayed(
        ButtonBoxAnimationDelegate.unpressiingDuration,
        () => _isPressed = false,
      );
    }
  }

  void _exit() {
    _buttonBoxAnimationDelegate?.exit();
  }
}
