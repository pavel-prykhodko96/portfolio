import 'package:flutter/material.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/screens/button_box/button_box_screen.dart';
import 'package:relax_button/screens/contact_us/contact_us_screen.dart';
import 'package:relax_button/screens/home/home_screen.dart';
import 'package:relax_button/screens/licenses/licenses_screen.dart';

Route generateRoute(RouteSettings settings) {
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
    case Routes.contactUsScreen:
      return MaterialPageRoute(
        builder: (context) => const ContactUsScreen(),
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
}
