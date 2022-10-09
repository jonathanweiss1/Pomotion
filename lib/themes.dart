import 'package:flutter/material.dart';

/// Specifies the themes for the complete app
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: Colors.deepOrange[700],
      backgroundColor: Colors.grey[200],
    )));
