import 'package:flutter/material.dart';
import 'package:pomotion/scaffold.dart';
import 'package:pomotion/settings.dart';

/// Two buttons side by side: start/stop and skip
///
/// @author: Jonathan Weiß
/// @email: jonathan.weiss.ansbach@gmail.com
/// @date: 02.10.2022

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  static final _settings = Settings();
  @override
  Widget build(BuildContext context) {
    return scaffold(
        context,
        GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            const Align(
                alignment: Alignment.centerRight, child: Text("Focus time")),
            Align(
                alignment: Alignment.centerLeft,
                child: FutureBuilder<int>(
                    future: _settings.getFocusTimeMinutes(),
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          return TextField(
                              controller: TextEditingController(
                                  text: snapshot.data.toString()),
                              onSubmitted: (String value) {
                                _settings.setFocusTimeMinutes(int.parse(value));
                              });
                      }
                    })),
            const Align(
                alignment: Alignment.centerRight, child: Text("Relax time")),
            Align(
                alignment: Alignment.centerLeft,
                child: FutureBuilder<int>(
                    future: _settings.getRelaxTimeMinutes(),
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          return TextField(
                              controller: TextEditingController(
                                  text: snapshot.data.toString()),
                              onSubmitted: (String value) {
                                _settings.setRelaxTimeMinutes(int.parse(value));
                              });
                      }
                    })),
          ],
        ),
        showSettings: false);
  }
}
