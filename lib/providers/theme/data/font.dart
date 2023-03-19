import 'package:flutter/material.dart';

// [TODO] : Define Falcon theme
final FalconFontLight = ThemeData.light().textTheme.copyWith(
    bodyMedium: const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ));
