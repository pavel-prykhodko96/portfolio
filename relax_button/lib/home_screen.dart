import 'package:flutter/material.dart';
import 'package:relax_button/keywords.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SMITrigger? _press;
  SMITrigger? _unpress;
  SMITrigger? _exit;

  _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
        artboard, RiveAnimationKeywords.mainStateMachine);
    artboard.addController(controller!);
    _press =
        controller.findInput<bool>(RiveAnimationKeywords.pressed) as SMITrigger;
    _unpress = controller.findInput<bool>(RiveAnimationKeywords.unpressed)
        as SMITrigger;
    _exit =
        controller.findInput<bool>(RiveAnimationKeywords.exited) as SMITrigger;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: replace Scaffold with Container?
    return Scaffold(
      // TODO: save this color somewhere.
      backgroundColor: const Color(0xff7DC4D9),
      body: RiveAnimation.asset(
        'assets/rive_animations/button_box.riv',
        fit: BoxFit.contain,
        onInit: _onRiveInit,
      ),
      // TODO: buttons are temp:
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => _press?.fire(),
            child: Text("Press"),
          ),
          ElevatedButton(
            onPressed: () => _unpress?.fire(),
            child: Text("Unpress"),
          ),
        ],
      ),
    );
  }
}
