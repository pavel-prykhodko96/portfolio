import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thoughts/constants/colors.dart';
import 'package:thoughts/post/bloc/post_bloc.dart';
import 'package:thoughts/post/post_repository.dart';
import 'package:thoughts/screens/homeScreen.dart';

void main() {
  runApp(ThoughtsApp());
}

class ThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostRepository(),
        )
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PostBloc(
                  postRepository:
                      RepositoryProvider.of<PostRepository>(context),
                ),
                lazy: false,
              )
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: ThoughtsColors.themeColor,
                splashColor:
                    Colors.transparent, // reduces splashes from the app
                highlightColor:
                    Colors.transparent, // reduces highlights from the app
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: HomeScreen(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
