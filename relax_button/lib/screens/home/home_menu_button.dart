import 'package:flutter/material.dart';

class HomeMenuButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final TextStyle textStyle;
  final Widget? widgetRightToText;
  const HomeMenuButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onPressed,
    this.widgetRightToText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 250,
      child: TextButton(
        style: TextButton.styleFrom(primary: textStyle.color),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            if (widgetRightToText != null) widgetRightToText!,
          ],
        ),
      ),
    );
  }
}
