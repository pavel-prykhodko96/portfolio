import 'package:flutter/material.dart';
import 'package:relax_button/home_screen_controller.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:rive/rive.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

class HomeScreen extends StatelessWidget {
  final HomeScreenController _homeScreenController = HomeScreenController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: check will it be rebuilt if placed to 'body' directly.
    // TODO: replaace with button box animation with property onInit that throws artboard up (without delegation)
    final _riveButtonBoxAnimation = RiveAnimation.asset(
      AnimationsPaths.buttonBoxAsset,
      fit: BoxFit.contain,
      onInit: _homeScreenController.initButtonBoxAnimationDelegate,
    );

    // TODO: streams for background color/picture and aadditional animations.
    // TODO: replace Scaffold with Container?
    return Scaffold(
      // TODO: save this color somewhere.
      backgroundColor: const Color(0xff7DC4D9),
      body: GestureDetector(
        child: _riveButtonBoxAnimation,
        // TODO: press only if tapped on the box, not anywhere?
        onTap: _homeScreenController.onButtonBoxTapped,
      ),
    );
  }
}
