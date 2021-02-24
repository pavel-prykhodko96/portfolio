import 'package:flutter/material.dart';
import 'package:thoughts/colors.dart';

class DrawerMenuButton extends StatelessWidget {
  final String _text;
  final Function _onPressed;
  DrawerMenuButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _text,
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
