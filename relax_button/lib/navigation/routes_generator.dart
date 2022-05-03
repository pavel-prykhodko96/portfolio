import 'package:flutter/material.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/screens/button_box/button_box_screen.dart';
import 'package:relax_button/screens/home/home_screen.dart';
import 'package:relax_button/screens/licenses/licenses_screen.dart';

Route generateRoute(RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (settings.name) {
        case Routes.homeScreen:
          return const HomeScreen();
        case Routes.buttonBoxScreen:
          return const ButtonBoxScreen();
        case Routes.licensesScreen:
          return const LicensesScreen();
        default:
          return const HomeScreen();
      }
    },
  );
}
