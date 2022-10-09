import 'package:flutter/material.dart';

/// Displays the current time of a timer
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

class TimerDisplay extends StatelessWidget {
  const TimerDisplay(

      /// secondsLeft is the time in seconds shown
      {super.key,
      this.secondsLeft = 0});
  final num secondsLeft;
  String getTimeAsString() {
    // convert int secondsLeft to String for display
    final minutes = secondsLeft / 60;
    final seconds = secondsLeft % 60;
    return "${minutes.floor()}:$seconds"; // floor only necessary because of data type
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getTimeAsString(), // convert secondsLeft to string on the fly
      textDirection: TextDirection.ltr,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Orbitron',
        fontSize: 60,
      ),
    );
  }
}
