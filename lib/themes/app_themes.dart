
import 'package:flutter/material.dart';
import 'package:notes_app/utils/components/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // primary: Colors.blue,
      // secondary: Colors.amber,
    ),
    // scaffoldBackgroundColor: Colors.white,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.blue,
    //   foregroundColor: Colors.white,
    // ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black),
    //   bodyMedium: TextStyle(color: Colors.black87),
    // ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      // primary: Colors.deepPurple,
      // secondary: Colors.tealAccent,
    ),
    scaffoldBackgroundColor: AppColors.dMedGreen,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.deepPurple,
    //   foregroundColor: Colors.white,
    // ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.white),
    //   bodyMedium: TextStyle(color: Colors.white70),
    // ),
  );
}
