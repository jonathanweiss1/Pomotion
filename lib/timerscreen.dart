import 'package:flutter/material.dart';
import 'package:pomotion/timer_components/display.dart';
import 'package:pomotion/timer_components/buttons.dart';
import 'package:pomotion/timer.dart';

/// Main interface for pomodoro timer
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool running = false; // state of timer (running / paused)
  PomoTimer timer = PomoTimer(focusTime: 10, relaxTime: 5);

  void _onPlayPause(bool running) {
    /// this is passed to the timer to update ui when necessary
    if (running) {
      timer.start(callback: (running) {
        setState(() {
          this.running = running;
        });
      });
    } else {
      timer.pause();
    }
    setState(() {
      this.running = running;
    });
  }

  void _onSkip(bool running) {
    /// this is passed to the timer to update ui when necessary
    if (!running) {
      timer.pause(skip: true);
      setState(() {
        running = running;
      });
    } else {
      timer.start(
          skip: true,
          callback: (running) {
            setState(() {
              running = running;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TimerDisplay(secondsLeft: timer.getCurrentTimeSeconds()),
          TimerButtons(
            running: running,
            onPlayPause: _onPlayPause,
            onSkip: _onSkip,
          )
        ],
      ),
    );
  }
}
