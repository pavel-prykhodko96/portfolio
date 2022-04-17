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
    // TODO: check if it will rebuilt if placed to 'body' directly.
    final _riveButtonBoxAnimation = RiveAnimation.asset(
      Paths.buttonBoxAsset,
      fit: BoxFit.contain,
      onInit: _homeScreenController.initButtonBoxAnimationDelegate,
    );

    // TODO: streams for background color/picture and aadditional animations.

    // TODO: replace Scaffold with Container?
    return Scaffold(
      // TODO: save this color somewhere.
      backgroundColor: const Color(0xff7DC4D9),
      body: _riveButtonBoxAnimation,
      // TODO: buttons are temp:
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => _homeScreenController.press(),
            child: Text("Press"),
          ),
          ElevatedButton(
            onPressed: () => _homeScreenController.unpress(),
            child: Text("Unpress"),
          ),
        ],
      ),
    );
  }
}
