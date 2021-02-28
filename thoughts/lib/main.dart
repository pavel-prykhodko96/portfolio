import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thoughts/constants/colors.dart';
import 'package:thoughts/screens/homeScreen.dart';

void main() {
  runApp(ThoughtsApp());
}

class ThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: themeColor,
          splashColor: Colors.transparent, // reduces splashes from the app
          highlightColor: Colors.transparent, // reduces highlights from the app
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
