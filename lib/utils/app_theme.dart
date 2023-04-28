import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: kAccentColor,
    secondary: kAccentColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: kAccentColor,
    surface: kPrimaryColor,
    onSurface: kAccentColor,
  ),
);
