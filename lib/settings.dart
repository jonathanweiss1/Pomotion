import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  // ------------------ singleton -----------------------
  static final Settings _instance = Settings._internal();
  factory Settings() => _instance;

  Settings._internal();
  // ------------------ singleton -----------------------

  Function callback = () {};

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setFocusTimeMinutes(int minutes) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('focusTimeMinutes', minutes);
    callback();
  }

  Future<int> getFocusTimeMinutes() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('focusTimeMinutes') ?? 25;
  }

  void setRelaxTimeMinutes(int minutes) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('relaxTimeMinutes', minutes);
    callback();
  }

  Future<int> getRelaxTimeMinutes() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('relaxTimeMinutes') ?? 5;
  }

  void setPauseTimeMinutes(int minutes) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('pauseTimeMinutes', minutes);
    callback();
  }

  Future<int> getPauseTimeMinutes() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('pauseTimeMinutes') ?? 15;
  }

  void setTheme(String theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('theme', theme);
    callback();
  }

  Future<String> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('theme') ?? "light";
  }

  void setCallback(callbackFunction) {
    callback = callbackFunction;
  }
}
