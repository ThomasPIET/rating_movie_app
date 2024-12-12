import 'package:flutter/material.dart';

var theme = ThemeData(
  colorScheme: const ColorScheme.dark(
      primary: Color(0xFF222222),
      brightness: Brightness.dark,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  useMaterial3: true,
);
