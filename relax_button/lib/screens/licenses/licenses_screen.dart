import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/models/color_model.dart';
import 'package:relax_button/models/sound_model.dart';

class LicensesScreen extends StatelessWidget {
  // TODO: implement style for whole aapp, not for eaach Text?

  const LicensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);
    final textColor = colorModel.textColor;
    final textStyle = TextStyle(inherit: false, color: textColor);

    return Container(
      color: colorModel.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemBuilder: (context, i) {
            final soundData = SoundModel.activeSoundsList[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Track: ' + soundData.trackName + ' - ' + soundData.author,
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
    );
  }
}
