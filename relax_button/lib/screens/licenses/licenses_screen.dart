import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/text_styles.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/models/sound_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relax_button/screens/licenses/license_description_tile.dart';
import 'package:relax_button/widgets/app_bar.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsController = Provider.of<ColorsController>(context);
    final textColor = colorsController.textColor;
    final subHeaderStyle =
        TextStyles.subHeader.copyWith(color: colorsController.textColor);
    final regularStyle = TextStyles.regular.copyWith(color: textColor);

    return Scaffold(
      appBar: RelaxButtonAppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          // Implement some controller to change bar title if here will be not only sounds on the screen
          RelaxButtonTexts.sounds,
          style: subHeaderStyle,
        ),
      ),
      backgroundColor: colorsController.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ...SoundModel.activeSoundsList.map(
                  (data) => LicenseDescriptionTile(
                    soundData: data,
                    textStyle: regularStyle,
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
