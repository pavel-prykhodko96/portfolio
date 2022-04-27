import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/repositories/preferences.dart';
import 'package:relax_button/routes_generator.dart' as routes_generator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorsController(),
      child: const MaterialApp(
        initialRoute: Routes.homeScreen,
        onGenerateRoute: routes_generator.generateRoute,
      ),
    );
  }
}
