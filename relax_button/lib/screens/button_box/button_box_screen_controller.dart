import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/models/sound_model.dart';
import 'package:relax_button/screens/button_box/button_box_animation_delegate.dart';
import 'package:rive/rive.dart';

class ButtonBoxScreenController {
  // TODO: currently it is here, but is it ok?:
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPressed = false;
  ButtonBoxAnimationDelegate? _buttonBoxAnimationDelegate;

  // TODO: fix it to set the controller only once. Set as final?
  initButtonBoxAnimationDelegate(Artboard artboard) {
    _buttonBoxAnimationDelegate = ButtonBoxAnimationDelegate(artboard);
  }

  dispose() {
    _audioPlayer.dispose();
  }

  void onButtonBoxTapped(BuildContext context) {
    // TODO: implement logic to choose if here should be a press or not.
    if (_buttonBoxAnimationDelegate != null && !_isPressed) {
      Provider.of<ColorsController>(context, listen: false)
          .changeBackgroundColorRandomly();
      _press();
    }
  }

  void _press() {
    if (_buttonBoxAnimationDelegate != null && !_isPressed) {
      _isPressed = true;
      final randomInt = Random().nextInt(SoundModel.activeSoundsList.length);
      _audioPlayer
          .setAsset(SoundModel.activeSoundsList[randomInt].trackPath)
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
