import 'package:flutter/material.dart';
import 'package:pomotion/settingsscreen.dart';
import 'package:pomotion/themes.dart';
import 'timerscreen.dart';

void main() => runApp(const FancyHelloWidget());

class FancyHelloWidget extends StatelessWidget {
  const FancyHelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const TimerScreen(),
        "/settings": (BuildContext context) => const SettingsScreen()
      },
      theme: lightTheme,
    );
  }
}
