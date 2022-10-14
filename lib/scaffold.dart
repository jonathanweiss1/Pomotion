import 'package:flutter/material.dart';

Scaffold scaffold(context, body, {bool showSettings = true}) {
  actionButtons() {
    if (showSettings) {
      return [
        IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Settings",
            onPressed: () => Navigator.pushNamed(context, '/settings'))
      ];
    } else {
      return null;
    }
  }

  return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pomotion",
          textDirection: TextDirection.ltr,
        ),
        actions: actionButtons(),
      ),
      body: body);
}
