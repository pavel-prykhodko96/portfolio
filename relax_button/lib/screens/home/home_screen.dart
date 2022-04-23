import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/models/background_color_model.dart';

class HomeScreen extends StatelessWidget {
  // TODO: set style in one place? (MaterialApp)
  final _textStyle = const TextStyle(color: Colors.white);

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: save this color somewhere./refactor
      color: Provider.of<BackgroundColorModel>(context).color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            // TODO: buttons can be creaated trough some method to not duplicate the code.
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
              child: Text(
                Texts.start,
                style: _textStyle,
              ),
            ),
            OutlinedButton(
              onPressed: () => null, // TODO: help Ukraine link
              child: Text(
                Texts.helpUkraine,
                style: _textStyle,
              ),
            ),
            // TODO: Do I need contact us screen at all?
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.contactUsScreen),
              child: Text(
                Texts.contactUs,
                style: _textStyle,
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.licensesScreen),
              child: Text(
                Texts.licenses,
                style: _textStyle,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
