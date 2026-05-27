import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor:
    const Color(0xFFF4F7FB),

    fontFamily: 'Arial',

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F8B5F),
    ),

    useMaterial3: true,
  );
}