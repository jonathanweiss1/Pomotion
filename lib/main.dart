import 'package:flutter/material.dart';
import 'package:pomotion/themes.dart';
import 'timerscreen.dart';

void main() => runApp(const FancyHelloWidget());

class FancyHelloWidget extends StatelessWidget {
  const FancyHelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pomotion",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: const TimerScreen(),
      ),
      theme: lightTheme,
    );
  }
}
