import 'package:flutter/material.dart';

class AppThemeDatas {
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xFFE3EEFF),
      secondary: Color(0xFF002359),
      onSecondary: Color(0xFFFFFFFF),
      background: Color(0xFFFAFCFF),
      onPrimary: Color(0xFF8FAFE0),
      inversePrimary: Color(0xFFFFFFFF),
      onPrimaryContainer: Color(0xFF002359),
    ),
    textTheme: TextTheme().copyWith(
      headline1: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFF002359)),
      headline2: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFF002359)),
      headline3: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 20, color: Color(0xFF002359)),
      headline4: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 50, color: Color(0xFF002359)),
      headline5: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 24, color: Color(0xFF002359)),
      headline6: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xFF002359)),
      button: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 32, color: Color(0xFF002359)),
      caption: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 79, color: Color(0xFF002359)),
      subtitle1: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF002359)),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFF02327D),
        secondary: Color(0xFFF3F5F7),
        onSecondary: Color(0xFFFFFFFF),
        background: Color(0xFF002359),
        onPrimary: Color(0xFF8FAFE0),
        inversePrimary: Color(0xFF02327D),
        onPrimaryContainer: Color(0xFF02327D)),
    textTheme: TextTheme().copyWith(
      headline1: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFFFFFFFF)),
      headline2: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFFFFFFFF)),
      headline3: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 20, color: Color(0xFFFFFFFF)),
      headline4: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFFFFFFFF)),
      headline5: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 24, color: Color(0xFFFFFFFF)),
      headline6: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xFF002359)),
      button: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 32, color: Color(0xFFFFFFFF)),
      caption: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 79, color: Color(0xFFFFFFFF)),
      subtitle1: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFFFFFFFF)),
    ),
  );
}
