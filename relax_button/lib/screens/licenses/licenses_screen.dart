import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/text_styles.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/models/sound_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relax_button/screens/licenses/license_description_tile.dart';
import 'package:relax_button/widgets/system_top_bar.dart';

class LicensesScreen extends StatelessWidget {
  // TODO: implement style for whole aapp, not for eaach Text?

  const LicensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsController = Provider.of<ColorsController>(context);
    final textColor = colorsController.textColor;
    final subHeaderStyle =
        TextStyles.subHeader.copyWith(color: colorsController.logoColor);
    final textStyle = TextStyles.regular.copyWith(
      color: textColor,
    );

    return Scaffold(
      appBar: SystemTopBar(),
      backgroundColor: colorsController.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  RelaxButtonTexts.sounds,
                  style: subHeaderStyle,
                ),
                SizedBox(height: 16.w),
                ...SoundModel.activeSoundsList.map(
                  (e) => LicenseDescriptionTile(
                    soundData: e,
                    textStyle: textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
