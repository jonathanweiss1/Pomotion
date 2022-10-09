import 'dart:async';

/// This is just a simple pomodoro timer without any UI. It has got a focus and
/// a relax phase with separate intervall lengths.
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

enum Phase { focus, relax }

class PomoTimer {
  /// holds timer and periodicTimer
  /// Timer is the actual clock, while periodicTimer updates the currentTimeSeconds variable
  Timer? timer; // keeps track of time for current phase
  Timer?
      periodicTimer; // counts seconds for callbacks each second (for example to update ui)
  final int focusTime; // length of focus phase in seconds
  final int relaxTime; // length of relax phase in seconds
  Phase phase = Phase.focus; // current phase
  num currentTimeSeconds = 0; // counts down to 0 every second
  Function? callback; // called every second (for example to update ui)

  PomoTimer({this.focusTime = 30 * 60, this.relaxTime = 5 * 60}) {
    /// focusTime: Time for each focus phase in seconds
    /// relaxTime: Time for each relax phase in seconds
    currentTimeSeconds = focusTime;
  }

  void start({bool skip = false, required callback}) {
    /// start / restart the timer
    /// callback: Function that is called each time the timer updates. Needs one parameter for currentTimeSeconds
    this.callback = callback;
    num remainingTime;

    // if skip is true or currentTimeSeconds is 0, start new full session, else resume the running session
    if (skip || currentTimeSeconds == 0) {
      // different logic depending on the phase --> consider state machine in documentation
      if (phase == Phase.focus) {
        phase = Phase.relax;
        remainingTime = relaxTime;
      } else {
        phase = Phase.focus;
        remainingTime = focusTime;
      }
    } else {
      // in this case the timer is just restarted after it has been stopped
      remainingTime = currentTimeSeconds;
    }
    currentTimeSeconds = remainingTime;

    // set new timers just in case the old one has not ended yet
    timer?.cancel();
    timer = Timer(Duration(seconds: remainingTime.toInt()), _timersUp);
    periodicTimer?.cancel();
    periodicTimer = Timer.periodic(const Duration(seconds: 1), _tick);
  }

  void pause({bool skip = false}) {
    /// pause the timer
    /// if skip is true, switches to the other phase but does not start the new phase
    if (skip) {
      if (phase == Phase.focus) {
        phase = Phase.relax;
        currentTimeSeconds = relaxTime;
      } else {
        phase = Phase.focus;
        currentTimeSeconds = focusTime;
      }
    }
    // timer is canceled so that callback is not called anymore
    // new timers are set by start()
    timer?.cancel();
    periodicTimer?.cancel();
  }

  void _timersUp() {
    /// called when the current session terminates
    periodicTimer?.cancel();
    currentTimeSeconds = 0;
    // see state machine in documentation for transitions
    if (phase == Phase.focus) {
      start(skip: true, callback: callback);
    } else {
      pause(skip: true);
    }
    callback!(false);
  }

  void _tick(_) {
    /// called every second
    currentTimeSeconds--;
    callback!(true);
  }

  num getCurrentTimeSeconds() {
    return currentTimeSeconds;
  }

  Phase getPhase() {
    return phase;
  }
}
