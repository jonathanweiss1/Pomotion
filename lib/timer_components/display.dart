import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Displays the current time of a timer
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

class TimerDisplay extends StatelessWidget {
  const TimerDisplay(

      /// secondsLeft is the time in seconds shown
      {super.key,
      this.secondsLeft = 0,
      this.secondsInitial = 0});
  final num secondsLeft;
  final num secondsInitial;
  String getTimeAsString() {
    // convert int secondsLeft to String for display
    final minutes = secondsLeft / 60;
    final seconds = secondsLeft % 60;
    var f = NumberFormat("00");
    return "${f.format(minutes.floor())}:${f.format(seconds)}"; // floor only necessary because of data type
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(8, 8),
                  color: Theme.of(context).primaryColorDark,
                  blurRadius: 30.0),
              BoxShadow(
                  offset: Offset(-8, -8),
                  color: Theme.of(context).primaryColorLight,
                  blurRadius: 30.0)
            ]),
        child: CircularPercentIndicator(
            radius: MediaQuery.of(context).size.width * 0.33,
            lineWidth: 8.0,
            percent: secondsLeft / secondsInitial,
            center: Text(
              getTimeAsString(), // convert secondsLeft to string on the fly
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Orbitron',
                fontSize: 60,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Theme.of(context).focusColor,
            backgroundColor: Theme.of(context).primaryColor));
  }
}
