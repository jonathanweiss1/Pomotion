import 'package:flutter/material.dart';

/// Two buttons side by side: start/stop and skip
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

class TimerButtons extends StatelessWidget {
  const TimerButtons(

      /// if running is true, start/stop button is shown as pause, else shown as play
      /// functions onPlayPause and onSkip are called when the respective buttons are pressed.
      {super.key,
      this.running = false,
      required this.onPlayPause,
      required this.onSkip});
  final bool running;
  final Function onPlayPause; // specifies what happens on button click
  final Function onSkip; // specifies what happens on button click

  Icon playPause() {
    /// decides which icon to use depending on running variable
    return running ? const Icon(Icons.pause) : const Icon(Icons.play_arrow);
  }

  _onPlayPause() {
    /// wrapper for onPlayPause argument
    onPlayPause(!running);
  }

  _onSkip() {
    /// wrapper for onSkip argument
    onSkip(running);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(8, 8),
                  color: Theme.of(context).shadowColor,
                  blurRadius: 30.0),
              BoxShadow(
                  offset: Offset(-8, -8),
                  color: Theme.of(context).splashColor,
                  blurRadius: 30.0)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 5,
                child: Container(
                    margin: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      onPressed: _onPlayPause,
                      child: playPause(),
                    ))),
            Expanded(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: _onSkip,
                        child: const Icon(Icons.skip_next))))
          ],
        ));
  }
}
