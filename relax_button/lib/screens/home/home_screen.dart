import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';
import 'package:relax_button/models/background_color_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: center widget is a temp
    return Container(
      // TODO: save this color somewhere./refactor
      color: Provider.of<BackgroundColorModel>(context).color,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.buttonBoxScreen),
            child: const Text(Texts.start),
          ),
        ],
      ),
    );
  }
}
