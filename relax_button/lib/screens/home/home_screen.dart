import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/models/color_model.dart';

class HomeScreen extends StatelessWidget {
  // TODO: set style in one place? (MaterialApp)

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);

    final buttonTextStyle = TextStyle(
      inherit: false,
      color: colorModel.textColor,
    );

    final logoTextStyle = TextStyle(
      inherit: false,
      fontSize: 30,
      color: colorModel.logoColor,
    );

    return Container(
      // TODO: save this color somewhere./refactor
      color: colorModel.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              Texts.relaxButton,
              style: logoTextStyle,
            ),
            const SizedBox(height: 64),
            // TODO: buttons can be creaated trough some method to not duplicate the code.
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
              child: Text(
                Texts.start,
                style: buttonTextStyle,
              ),
            ),
            OutlinedButton(
              onPressed: () => null, // TODO: help Ukraine link
              child: Text(
                Texts.helpUkraine,
                style: buttonTextStyle,
              ),
            ),
            // TODO: Do I need contact us screen at all?
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.contactUsScreen),
              child: Text(
                Texts.contactUs,
                style: buttonTextStyle,
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.licensesScreen),
              child: Text(
                Texts.licenses,
                style: buttonTextStyle,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
