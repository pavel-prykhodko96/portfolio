import 'package:flutter/material.dart';
import 'package:thoughts/colors.dart';
import 'package:thoughts/screens/homeScreen.dart';

void main() {
  runApp(ThoughtsApp());
}

class ThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: themeColor,
        splashColor: Colors.transparent, // reduces splashes from the app
        highlightColor: Colors.transparent, // reduces highlights from the app
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
