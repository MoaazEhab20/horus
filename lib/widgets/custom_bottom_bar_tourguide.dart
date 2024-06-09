import 'package:final_project/screens/tourguideview/tourguide_chat_screen.dart';

import 'package:final_project/screens/tourguideview/tourgide_profile_screen.dart';
import 'package:final_project/screens/tourguideview/tourguide_home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomBartourguide extends StatefulWidget {
  const CustomBottomBartourguide({super.key});

  @override
  State<CustomBottomBartourguide> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBartourguide> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    TourguideHomeScreen(),
    TourguideChatScreen(),
    TourguideProfileScreen(),
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: 'profile'),
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
