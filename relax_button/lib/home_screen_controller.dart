import 'dart:math';

import 'package:just_audio/just_audio.dart';
import 'package:relax_button/button_box_animation_delegate.dart';
import 'package:relax_button/home_screen_model.dart';
import 'package:rive/rive.dart';

class HomeScreenController {
  // TODO: currently it is here, but is it ok?:
  final AudioPlayer _audioPlayer = AudioPlayer();
  ButtonBoxAnimationDelegate? _buttonBoxAnimationDelegate;

  HomeScreenController() {
    _audioPlayer.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        _unpress();
      }
    });
  }

  // TODO: to be extendeed with changing background color, playing sounds etc.
  // TODO: fix it to set the controller only once. Set as final?
  initButtonBoxAnimationDelegate(Artboard artboard) {
    _buttonBoxAnimationDelegate = ButtonBoxAnimationDelegate(artboard);
  }

  void press() {
    // TODO: refactor condition and selecting random value?
    if (_buttonBoxAnimationDelegate != null) {
      _audioPlayer.setAsset(HomeScreenModel.possibleSoundsAssetsPaths[
          Random().nextInt(HomeScreenModel.possibleSoundsAssetsPaths.length)]);
      _buttonBoxAnimationDelegate!.press();
      _audioPlayer.play();
    }
  }

  void _unpress() {
    _buttonBoxAnimationDelegate?.unpress();
  }

  void _exit() {
    _buttonBoxAnimationDelegate?.exit();
  }
}
