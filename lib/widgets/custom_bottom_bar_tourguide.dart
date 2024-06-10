import 'package:flutter/material.dart';

import '../screens/tourguideview/tourgide_profile_screen.dart';
import '../screens/tourguideview/tourguide_chat_screen.dart';
import '../screens/tourguideview/tourguide_home_screen.dart';

class CustomBottomBartourguide extends StatefulWidget {
  const CustomBottomBartourguide({super.key});

  @override
  State<CustomBottomBartourguide> createState() => _CustomBottomBartourguideState();
}

class _CustomBottomBartourguideState extends State<CustomBottomBartourguide> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    TourguideHomeScreen(),
    TourguideChatScreen(),
    TourguideProfileScreen(),
  ];

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(flex: 1,),
            _buildNavItem(Icons.home, 'home', 0),
            Spacer(flex: 2,),
            _buildNavItem(Icons.chat, 'chat', 1),
            Spacer(flex: 2,), 
            _buildNavItem(Icons.person_rounded, 'profile', 2),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _changeItem(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? const Color(0XFFF5903F) : Colors.grey,
            size: isSelected ? 30.0 : 26.0, // 1.5 times larger for the selected icon
          ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(
                color: const Color(0XFFF5903F)
              ),
            ),
        ],
      ),
    );
  }
}
