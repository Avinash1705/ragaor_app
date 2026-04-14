/// app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue =
  Color(0xff0d5cff);

  /// ---------------- LIGHT THEME ----------------
  static ThemeData lightTheme =
  ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",

    brightness: Brightness.light,

    scaffoldBackgroundColor:
    Colors.white,

    colorScheme:
    ColorScheme.fromSeed(
      brightness:
      Brightness.light,
      seedColor:
      primaryBlue,
      primary:
      primaryBlue,
    ),

    appBarTheme:
    const AppBarTheme(
      backgroundColor:
      Colors.white,
      foregroundColor:
      Colors.black,
      centerTitle: true,
      elevation: 0,
    ),

    inputDecorationTheme:
    InputDecorationTheme(
      filled: true,
      fillColor:
      Colors.grey.shade100,
      hintStyle:
      const TextStyle(
        color: Colors.black45,
      ),
      border:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        BorderSide.none,
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        BorderSide.none,
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        const BorderSide(
          color:
          primaryBlue,
          width: 1.4,
        ),
      ),
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(
      style:
      ElevatedButton.styleFrom(
        backgroundColor:
        primaryBlue,
        foregroundColor:
        Colors.white,
        minimumSize:
        const Size(
            double.infinity,
            56),
        shape:
        RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
              30),
        ),
        textStyle:
        const TextStyle(
          fontSize: 18,
          fontWeight:
          FontWeight.bold,
        ),
      ),
    ),

    cardTheme:
    CardThemeData(
      color: Colors.white,
      elevation: 3,
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(
            18),
      ),
    ),
  );

  /// ---------------- DARK THEME ----------------
  static ThemeData darkTheme =
  ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",

    brightness: Brightness.dark,

    scaffoldBackgroundColor:
    const Color(0xff08162E),

    colorScheme:
    ColorScheme.fromSeed(
      brightness:
      Brightness.dark,
      seedColor:
      primaryBlue,
      primary:
      primaryBlue,
      surface:
      const Color(
          0xff10213f),
    ),

    appBarTheme:
    const AppBarTheme(
      backgroundColor:
      Color(0xff08162E),
      foregroundColor:
      Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    inputDecorationTheme:
    InputDecorationTheme(
      filled: true,
      fillColor:
      const Color(
          0xff10213f),
      hintStyle:
      const TextStyle(
        color: Colors.white54,
      ),
      border:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        BorderSide.none,
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        BorderSide.none,
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            18),
        borderSide:
        const BorderSide(
          color:
          primaryBlue,
          width: 1.4,
        ),
      ),
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(
      style:
      ElevatedButton.styleFrom(
        backgroundColor:
        primaryBlue,
        foregroundColor:
        Colors.white,
        minimumSize:
        const Size(
            double.infinity,
            56),
        shape:
        RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
              30),
        ),
        textStyle:
        const TextStyle(
          fontSize: 18,
          fontWeight:
          FontWeight.bold,
        ),
      ),
    ),

    cardTheme:
    CardThemeData(
      color:
      const Color(
          0xff10213f),
      elevation: 2,
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(
            18),
      ),
    ),
  );
}