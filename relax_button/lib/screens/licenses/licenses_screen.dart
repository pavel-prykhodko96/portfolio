import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/models/background_color_model.dart';
import 'package:relax_button/models/sound_model.dart';

class LicensesScreen extends StatelessWidget {
  // TODO: implement style for whole aapp, not for eaach Text?
  final _textStyle = const TextStyle(inherit: false);

  const LicensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<BackgroundColorModel>(context).color,
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
                  style: _textStyle,
                ),
                Text(
                  'Material link: ' + soundData.materiallink,
                  style: _textStyle,
                ),
                Text(
                  'License link: ' + soundData.licenseLink,
                  style: _textStyle,
                ),
                const Divider(color: Colors.white),
              ],
            );
          },
          itemCount: SoundModel.activeSoundsList.length,
        ),
      ),
    );
  }
}
