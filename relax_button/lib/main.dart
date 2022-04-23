import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/models/color_model.dart';
import 'package:relax_button/routes_generator.dart' as routes_generator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorModel(const Color(0xff7DC4D9)),
      child: const MaterialApp(
        initialRoute: Routes.homeScreen,
        onGenerateRoute: routes_generator.generateRoute,
      ),
    );
  }
}
