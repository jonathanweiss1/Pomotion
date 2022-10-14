import 'package:flutter/material.dart';

/// Specifies the themes for the complete app
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

var lightThemeBackground = Colors.grey[50];
var lightThemePrimary = Colors.deepOrange;
final ThemeData lightTheme = ThemeData(
    primarySwatch: lightThemePrimary,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: lightThemePrimary[700],
      backgroundColor: Colors.grey[200],
    )),
    appBarTheme: AppBarTheme(
        backgroundColor: lightThemeBackground,
        elevation: 0,
        foregroundColor: lightThemePrimary),
    scaffoldBackgroundColor: lightThemeBackground);
