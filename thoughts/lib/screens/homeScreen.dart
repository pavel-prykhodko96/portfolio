import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thoughts/constants/colors.dart';
import 'package:thoughts/post/bloc/post_bloc.dart';
import 'package:thoughts/post/bloc/post_events.dart';
import 'package:thoughts/post/bloc/post_states.dart';
import 'package:thoughts/post/post_widget.dart';
import 'package:thoughts/widgets/drawer_menu_button.dart';
import 'package:thoughts/widgets/thoughts_label.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 1;

  void _changeTab(newIndex) {
    setState(() {
      _currentTabIndex = newIndex;
      BlocProvider.of<PostBloc>(context).add(AllPosts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Maybe delete later DefaultTabController
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: ThoughtsColors.themeColor,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(height: 60, child: ThoughtsLabel()),
                Divider(height: 0, color: ThoughtsColors.whiteColor),
                DrawerMenuButton("Edit profile", null),
                Divider(height: 0, color: ThoughtsColors.whiteColor),
                DrawerMenuButton("Log out", null),
                Divider(height: 0, color: ThoughtsColors.whiteColor),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThoughtsColors.actionColor,
          onPressed: null,
          child: Icon(Icons.add, size: 32),
        ),
        appBar: AppBar(
          title: ThoughtsLabel(),
          leading: Builder(
            builder: (context) {
              return IconButton(
                color: ThoughtsColors.whiteColor,
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostSuccess) {
              if (state.posts.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return PostWidget(post: state.posts[index]);
                },
                itemCount: 1,
                // controller: _scrollController,
              );
            }
            return Center(
              child: Text('Something went wrong'),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          onTap: _changeTab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: ThoughtsColors.whiteColor,
          selectedItemColor: ThoughtsColors.actionColor,
          backgroundColor: ThoughtsColors.themeColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Feed', // Isn't shown
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Liked', // Isn't shown
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile', // Isn't shown
            ),
          ],
        ),
      ),
    );
  }
}
