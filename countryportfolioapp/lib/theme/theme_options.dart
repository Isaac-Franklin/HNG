import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 50,
      fontFamily: 'StyleScript',
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey[300]!,
    secondary: Colors.grey[200]!,
  ),
  focusColor: const Color.fromARGB(255, 231, 231, 231),

  //
  fontFamily: 'montserrat',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 20,
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w400,
    ),
  ),
);

// DARK MODE PARAMETERS
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(0, 15, 36, 1),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'StyleScript',
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.dark(
    surface: const Color.fromRGBO(0, 15, 36, 1),
    primary: Colors.grey[800]!,
    secondary: Colors.grey[800]!,
  ),
  focusColor: Colors.grey[800],

  //
  fontFamily: 'montserrat',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.grey,
      fontSize: 18,
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w400,
    ),
  ),
);
