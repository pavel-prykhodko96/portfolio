import 'package:flutter/material.dart';
import 'package:relax_button/constants/texts.dart';

class MailReferenceBottomSheet extends StatelessWidget {
  final TextStyle _textStyle;
  const MailReferenceBottomSheet(this._textStyle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        RelaxButtonTexts.noMail,
        style: _textStyle,
      ),
    );
  }
}
