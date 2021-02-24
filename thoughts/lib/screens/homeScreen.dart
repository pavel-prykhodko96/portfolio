import 'package:flutter/material.dart';
import 'package:thoughts/colors.dart';
import 'package:thoughts/widgets/drawerMenuButton.dart';
import 'package:thoughts/widgets/thoughtsLabel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIdex = 1;

  void _changeTab(newIndex) {
    setState(() {
      _currentIdex = newIndex;
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
            color: themeColor,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(height: 60, child: ThoughtsLabel()),
                Divider(height: 0, color: whiteColor),
                DrawerMenuButton("Edit profile", null),
                Divider(height: 0, color: whiteColor),
                DrawerMenuButton("Log out", null),
                Divider(height: 0, color: whiteColor),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: actionColor,
          onPressed: null,
          child: Icon(Icons.add, size: 32),
        ),
        appBar: AppBar(
          title: ThoughtsLabel(),
          leading: Builder(
            builder: (context) {
              return IconButton(
                color: whiteColor,
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIdex,
          onTap: _changeTab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: whiteColor,
          selectedItemColor: actionColor,
          backgroundColor: themeColor,
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
