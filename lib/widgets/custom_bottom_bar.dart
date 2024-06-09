import 'package:final_project/screens/touristview/chat_screen.dart';
import 'package:final_project/screens/touristview/favourite_screen.dart';
import 'package:final_project/screens/touristview/home_screen.dart';
import 'package:final_project/screens/touristview/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: SizedBox(
        child: Theme(
          data: ThemeData(
              bottomNavigationBarTheme:
                  Theme.of(context).bottomNavigationBarTheme),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.home),
                  label: 'home'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.chat),
                  label: 'chat'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.favorite),
                  label: 'favorite'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.person_rounded),
                  label: 'profile'),
            ],
            currentIndex: _currentIndex,
            onTap: _changeItem,
          ),
        ),
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
