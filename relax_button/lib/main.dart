import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/models/sizes_model.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 667), // iPhone SE 2nd gen logical resolution
      builder: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ColorsController(),
          ),
          // Can be deleted if not used:
          Provider(
            create: (context) => SizesModel(
                systemIconsTopHeight:
                    MediaQueryData.fromWindow(window).padding.top),
          ),
        ],
        builder: (context, widget) => const MaterialApp(
          initialRoute: Routes.homeScreen,
          onGenerateRoute: routes_generator.generateRoute,
        ),
      ),
    );
  }
}
