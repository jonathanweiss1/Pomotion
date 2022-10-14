import 'package:flutter/material.dart';
import 'package:pomotion/settings.dart';
import 'package:pomotion/timer_components/display.dart';
import 'package:pomotion/timer_components/buttons.dart';
import 'package:pomotion/timer.dart';
import 'package:pomotion/scaffold.dart';

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
  Settings _settings = Settings();
  int focusTime = 25;
  int relaxTime = 5;
  PomoTimer timer = PomoTimer(focusTime: 25 * 60, relaxTime: 5 * 60);

  @override
  void initState() {
    super.initState();
    initTimer();
    _settings.setCallback(initTimer);
  }

  void initTimer() {
    _loadFocus().then((focusValue) {
      _loadRelax().then((relaxValue) {
        setState(() {
          timer = (PomoTimer(
              focusTime: focusValue * 60, relaxTime: relaxValue * 60));
        });
        _onPlayPause(false);
      });
    });
  }

  Future<int> _loadFocus() async {
    return _settings.getFocusTimeMinutes();
  }

  Future<int> _loadRelax() async {
    return _settings.getRelaxTimeMinutes();
  }

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
    return scaffold(
        context,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerDisplay(
                  secondsLeft: timer.getCurrentTimeSeconds(),
                  secondsInitial: timer.getPhase() == Phase.focus
                      ? timer.focusTime
                      : timer.relaxTime),
              TimerButtons(
                running: running,
                onPlayPause: _onPlayPause,
                onSkip: _onSkip,
              )
            ],
          ),
        ));
  }
}
