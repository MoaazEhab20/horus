import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    //for text
    primaryColor: Color(0xff253544),
    canvasColor: Colors.black,
    //for card and bottom
    primaryColorLight: Color(0xffF5F5F5),
    cardColor: Color(0xffF5F5F5),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Inter',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: const Color(0XFFF5903F),
      unselectedItemColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      //for any title
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: Color(0xff253544),
      ),
      // home title
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: Color(0xff253544),
      ),
      //for home body
      bodyLarge: TextStyle(
        color: Color(0xff253544),
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      //for categories home
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Color(0xff253544),
        fontFamily: 'Inter',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    primaryColorLight: Color(0xff282C34),
    cardColor: Color(0xff282C34),
    scaffoldBackgroundColor: Color(0xff1F1F1F),
    //Color(0xff282C34)
    fontFamily: 'Inter',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: const Color(0XFFF5903F),
      unselectedItemColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      //for any title
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      // home title
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      //for home body
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      //for categories home
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontFamily: 'Inter',
      ),
    ),
  );
}
