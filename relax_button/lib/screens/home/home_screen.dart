import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/screens/home/home_menu_button.dart';
import 'package:relax_button/utils/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  // TODO: set style in one place? (MaterialApp)

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsController = Provider.of<ColorsController>(context);

    // TODO: send color only to button widget?
    final buttonTextStyle = TextStyle(
      inherit: false,
      color: colorsController.textColor,
    );

    final logoTextStyle = TextStyle(
      inherit: false,
      fontSize: 30,
      color: colorsController.logoColor,
    );

    return Container(
      color: colorsController.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              RelaxButtonTexts.relaxButton,
              style: logoTextStyle,
            ),
            const SizedBox(height: 8),
            Divider(color: colorsController.textColor),
            HomeMenuButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
              text: RelaxButtonTexts.start,
              textStyle: buttonTextStyle,
            ),
            HomeMenuButton(
              onPressed: () => UrlLauncher.launchHelpUkraine(),
              text: RelaxButtonTexts.helpUkraine,
              textStyle: buttonTextStyle,
              widgetRightToText: SvgPicture.asset(
                SvgsPaths.ukraineFlag,
                height: 24,
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
            HomeMenuButton(
              onPressed: () => UrlLauncher.launchMailTo(),
              text: RelaxButtonTexts.contactUs,
              textStyle: buttonTextStyle,
            ),
            HomeMenuButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.licensesScreen),
              text: RelaxButtonTexts.licenses,
              textStyle: buttonTextStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
