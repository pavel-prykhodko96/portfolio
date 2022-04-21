import 'package:flutter/material.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/constants/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: center widget is a temp
    return Container(
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
