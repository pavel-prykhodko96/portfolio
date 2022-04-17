import 'package:relax_button/constants/keywords.dart';
import 'package:rive/rive.dart';

// TODO: replaace with button box animation with property onInit that throws artboard up (without delegation)?
class ButtonBoxAnimationDelegate {
  late final StateMachineController _stateMachineController;
  late final SMITrigger _press;
  late final SMITrigger _unpress;
  late final SMITrigger _exit;

  ButtonBoxAnimationDelegate(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
        artboard, ButtonBoxKeywords.mainStateMachine)!;
    artboard.addController(_stateMachineController);
    _press = _stateMachineController.findInput<bool>(ButtonBoxKeywords.pressed)
        as SMITrigger;
    _unpress = _stateMachineController
        .findInput<bool>(ButtonBoxKeywords.unpressed) as SMITrigger;
    _exit = _stateMachineController.findInput<bool>(ButtonBoxKeywords.exited)
        as SMITrigger;
  }

  press() {
    _press.fire();
  }

  unpress() {
    _unpress.fire();
  }

  exit() {
    _exit.fire();
  }
}
