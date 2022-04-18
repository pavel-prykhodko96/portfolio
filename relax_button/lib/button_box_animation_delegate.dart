import 'package:relax_button/constants/keywords.dart';
import 'package:rive/rive.dart';

enum AnimationState { pressing, unpressing, idle, unknown }

// TODO: replaace with button box animation with property onInit that throws artboard up (without delegation)?
class ButtonBoxAnimationDelegate {
  static const pressingDuration = Duration(milliseconds: 500);
  static const unpressiingDuration = Duration(seconds: 1);

  late final StateMachineController _stateMachineController;
  late final SMITrigger _press;
  late final SMITrigger _unpress;
  late final SMITrigger _exit;

  AnimationState _animationState = AnimationState.unknown;
  AnimationState get animationState => _animationState;

  ButtonBoxAnimationDelegate(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
        artboard, ButtonBoxKeywords.mainStateMachine,
        onStateChange: _stateMachineControllerStateChanged)!;
    artboard.addController(_stateMachineController);
    _press = _stateMachineController.findInput<bool>(ButtonBoxKeywords.pressed)
        as SMITrigger;
    _unpress = _stateMachineController
        .findInput<bool>(ButtonBoxKeywords.unpressed) as SMITrigger;
    _exit = _stateMachineController.findInput<bool>(ButtonBoxKeywords.exited)
        as SMITrigger;
  }

  void _stateMachineControllerStateChanged(
      String stateMachineName, String animationName) {
    print(animationName);
    if (animationName == ButtonBoxKeywords.idleAnimation) {
      _animationState = AnimationState.idle;
    } else if (animationName == ButtonBoxKeywords.pressingAnimation) {
      _animationState = AnimationState.pressing;
    } else if (animationName == ButtonBoxKeywords.unpressingAnimation) {
      _animationState = AnimationState.unpressing;
    } else {
      _animationState = AnimationState.unknown;
    }
  }

  void press() {
    _press.fire();
  }

  void unpress() {
    _unpress.fire();
  }

  void exit() {
    _exit.fire();
  }
}
