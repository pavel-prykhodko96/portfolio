import 'package:flutter/material.dart';
import 'package:relax_button/models/sound_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LicenseDescriptionTile extends StatelessWidget {
  final SoundModel soundData;
  final TextStyle textStyle;
  const LicenseDescriptionTile(
      {Key? key, required this.soundData, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            soundData.trackName + ' - ' + soundData.author,
            style: textStyle,
          ),
          Text(
            soundData.materiallink,
            style: textStyle,
          ),
          Text(
            soundData.licenseLink,
            style: textStyle,
          ),
          SizedBox(height: 16.w)
        ],
      ),
    );
  }
}
