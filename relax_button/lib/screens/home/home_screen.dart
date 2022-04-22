import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/models/background_color_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: save this color somewhere./refactor
      color: Provider.of<BackgroundColorModel>(context).color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
              child: const Text(
                Texts.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () => null, // TODO: help Ukraine link
              child: const Text(
                Texts.helpUkraine,
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.contactUsScreen),
              child: const Text(
                Texts.contactUs,
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.licensesScreen),
              child: const Text(
                Texts.licenses,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
