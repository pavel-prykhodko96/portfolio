import 'package:flutter/material.dart';

class HomeMenuButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final TextStyle textStyle;
  const HomeMenuButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 200,
      child: TextButton(
        style: TextButton.styleFrom(primary: textStyle.color),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
