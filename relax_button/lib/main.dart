import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:relax_button/constants/routes.dart';
import 'package:relax_button/controllers/colors_controller.dart';
import 'package:relax_button/navigation/navigator.dart';
import 'package:relax_button/repositories/preferences.dart';
import 'package:relax_button/navigation/routes_generator.dart'
    as routes_generator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        ],
        builder: (context, widget) => MaterialApp(
          initialRoute: Routes.homeScreen,
          onGenerateRoute: routes_generator.generateRoute,
          navigatorKey: navigator,
        ),
      ),
    );
  }
}
