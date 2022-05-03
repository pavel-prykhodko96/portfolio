import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/screens/button_box/button_box_screen_controller.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:relax_button/widgets/app_bar.dart';
import 'package:rive/rive.dart';

class ButtonBoxScreen extends StatefulWidget {
  const ButtonBoxScreen({Key? key}) : super(key: key);

  @override
  State<ButtonBoxScreen> createState() => _ButtonBoxScreenState();
}

class _ButtonBoxScreenState extends State<ButtonBoxScreen> {
  final ButtonBoxScreenController _buttonBoxScreenController =
      ButtonBoxScreenController();

  @override
  void dispose() {
    _buttonBoxScreenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final riveButtonBoxAnimation = RiveAnimation.asset(
      AnimationsPaths.buttonBoxAsset,
      fit: BoxFit.contain,
      onInit: _buttonBoxScreenController.initButtonBoxAnimationDelegate,
    );

    final colorsController = Provider.of<ColorsController>(context);

    return Scaffold(
      backgroundColor: colorsController.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: RelaxButtonAppBar(
        iconTheme: IconThemeData(color: colorsController.textColor),
      ),
      body: GestureDetector(
        child: riveButtonBoxAnimation,
        onTap: () {
          _buttonBoxScreenController.onButtonBoxTapped(context);
        },
      ),
    );
  }
}
