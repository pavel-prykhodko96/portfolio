import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/paths.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/text_styles.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/screens/home/home_menu_button.dart';
import 'package:relax_button/utils/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relax_button/widgets/mail_reference_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsController = Provider.of<ColorsController>(context);

    final buttonTextStyle =
        TextStyles.regular.copyWith(color: colorsController.textColor);

    final logoTextStyle =
        TextStyles.header.copyWith(color: colorsController.logoColor);

    final bottomSheetTextStyle =
        TextStyles.regular.copyWith(color: colorsController.textColor);

    return Scaffold(
      backgroundColor: colorsController.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              RelaxButtonTexts.relaxButton,
              style: logoTextStyle,
            ),
            SizedBox(height: 7.w),
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
                height: 24.w,
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
            HomeMenuButton(
              onPressed: () => UrlLauncher.launchMailTo(
                () => {
                  showModalBottomSheet(
                    backgroundColor: colorsController.backgroundColor,
                    context: context,
                    builder: (context) =>
                        MailReferenceBottomSheet(bottomSheetTextStyle),
                  )
                },
              ),
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
