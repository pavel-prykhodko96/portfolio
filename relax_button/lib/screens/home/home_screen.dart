import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/screens/home/home_menu_button.dart';

class HomeScreen extends StatelessWidget {
  // TODO: set style in one place? (MaterialApp)

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorsController>(context);

    // TODO: send color only to button widget?
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              Texts.relaxButton,
              style: logoTextStyle,
            ),
            SizedBox(height: 8),
            Divider(color: buttonTextStyle.color),
            // TODO: buttons can be creaated trough some method to not duplicate the code.
            HomeMenuButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
              text: Texts.start,
              textStyle: buttonTextStyle,
            ),
            HomeMenuButton(
              onPressed: () => null, // TODO: help Ukraine link
              text: Texts.helpUkraine,
              textStyle: buttonTextStyle,
            ),
            // TODO: Do I need contact us screen at all?
            HomeMenuButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.contactUsScreen),
              text: Texts.contactUs,
              textStyle: buttonTextStyle,
            ),
            HomeMenuButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.licensesScreen),
              text: Texts.licenses,
              textStyle: buttonTextStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
