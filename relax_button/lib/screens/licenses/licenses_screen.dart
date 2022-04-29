import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/text_styles.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/models/sound_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LicensesScreen extends StatelessWidget {
  // TODO: implement style for whole aapp, not for eaach Text?

  const LicensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsController = Provider.of<ColorsController>(context);
    final textColor = colorsController.textColor;
    // final headerStyle =
    // TextStyles.header.copyWith(color: colorsController.logoColor);
    final textStyle = TextStyles.regular.copyWith(
      color: textColor,
    );

    return Scaffold(
      backgroundColor: colorsController.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          // TODO:
          // SizedBox(
          //   height: 50.w,
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Text(
          //       RelaxButtonTexts.licenses,
          //       style: headerStyle,
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                final soundData = SoundModel.activeSoundsList[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track: ' +
                          soundData.trackName +
                          ' - ' +
                          soundData.author,
                      style: textStyle,
                    ),
                    Text(
                      'Material link: ' + soundData.materiallink,
                      style: textStyle,
                    ),
                    Text(
                      'License link: ' + soundData.licenseLink,
                      style: textStyle,
                    ),
                    Divider(color: textColor),
                  ],
                );
              },
              itemCount: SoundModel.activeSoundsList.length,
            ),
          ),
        ]),
      ),
    );
  }
}
