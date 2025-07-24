import 'package:hive_flutter/hive_flutter.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  static const String _boxName = "sessionBox";
  Box? _box;

  SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  static SessionManager getInstance() {
    return _instance;
  }

  Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.initFlutter();
      _box = await Hive.openBox(_boxName);
    } else {
      _box = Hive.box(_boxName);
    }
  }

  Future<void> setToken(String token) async {
    await _box?.put('token', token);
  }

  String? getToken() {
    return _box?.get("token");
  }
}
