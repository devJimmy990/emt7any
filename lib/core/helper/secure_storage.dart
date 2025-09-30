import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage(this._storage);
  final FlutterSecureStorage _storage;

  Future<void> writeString(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<String?> readString(String key) async => await _storage.read(key: key);

  Future<void> writeObject<T>(String key, T value) async =>
      await _storage.write(key: key, value: jsonEncode(value));

  Future<Map<String, dynamic>?> readObject(String key) async {
    final jsonStr = await _storage.read(key: key);
    if (jsonStr == null) return null;
    return jsonDecode(jsonStr) as Map<String, dynamic>;
  }

  Future<void> delete(String key) async => await _storage.delete(key: key);

  Future<void> clear() async => await _storage.deleteAll();
}
