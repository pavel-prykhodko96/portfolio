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
          return ButtonBoxScreen();
        case Routes.licensesScreen:
          return const LicensesScreen();
        default:
          return const HomeScreen();
      }
    },
  );
}
/*
  switch (settings.name) {
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: settings,
      );
    case Routes.buttonBoxScreen:
      return MaterialPageRoute(
        builder: (context) => ButtonBoxScreen(),
        settings: settings,
      );
    case Routes.licensesScreen:
      return MaterialPageRoute(
        builder: (context) => const LicensesScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: settings,
      );
  }
  */

