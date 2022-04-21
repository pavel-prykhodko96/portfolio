import 'package:flutter/material.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/routes_generator.dart' as routesGenerator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.homeScreen,
      onGenerateRoute: routesGenerator.generateRoute,
    );
  }
}
