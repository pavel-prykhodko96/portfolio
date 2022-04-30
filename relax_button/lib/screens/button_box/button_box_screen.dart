import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/screens/button_box/button_box_screen_controller.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:relax_button/widgets/app_bar.dart';
import 'package:rive/rive.dart';

class ButtonBoxScreen extends StatelessWidget {
  final ButtonBoxScreenController _buttonBoxScreenController =
      ButtonBoxScreenController();

  ButtonBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: check will it be rebuilt if placed to 'body' directly.
    // TODO: replaace with button box animation with property onInit that throws artboard up (without delegation)
    final _riveButtonBoxAnimation = RiveAnimation.asset(
      AnimationsPaths.buttonBoxAsset,
      fit: BoxFit.contain,
      onInit: _buttonBoxScreenController.initButtonBoxAnimationDelegate,
    );

    final colorsController = Provider.of<ColorsController>(context);

    // TODO: streams for background color/picture and aadditional animations.
    // TODO: replace Scaffold with Container?
    return Scaffold(
      backgroundColor: colorsController.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: RelaxButtonAppBar(
        iconTheme: IconThemeData(color: colorsController.textColor),
      ),
      body: GestureDetector(
        child: _riveButtonBoxAnimation,
        // TODO: press only if tapped on the box, not anywhere?
        onTap: () {
          _buttonBoxScreenController.onButtonBoxTapped(context);
        },
      ),
    );
  }
}
