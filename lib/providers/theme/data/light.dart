import 'package:client_app/providers/theme/data/font.dart';
import 'package:flutter/material.dart';

ThemeData LIGHT_THEME = ThemeData(
  primaryColor: Color(0xFF1CEF31),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  textTheme: FalconFontLight,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green),
    ),
  ),
);
