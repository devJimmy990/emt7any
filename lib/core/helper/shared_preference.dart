import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference(this._shared);
  final SharedPreferences _shared;

  Future<bool> setString({required String key, required String value}) async =>
      _shared.setString(key, value);

  Future<bool> setBool({required String key, required bool value}) async =>
      _shared.setBool(key, value);

  Future<bool> setInt({required String key, required num value}) async =>
      _shared.setInt(key, value.toInt());

  Future<bool> remove(String key) async => _shared.remove(key);

  bool getBool(String key) => _shared.getBool(key) ?? false;

  String? getString(String key) => _shared.getString(key);

  int? getInt(String key) => _shared.getInt(key);

  Future<bool> clear() async => _shared.clear();
}
