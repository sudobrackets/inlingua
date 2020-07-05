import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  static final AppStorage _appStorage = AppStorage._();

  factory AppStorage() => _appStorage;

  AppStorage._() {
    init();
  }
  static FlutterSecureStorage _secureStorage;
  void init() {
    _secureStorage = const FlutterSecureStorage();
  }

  Future<bool> setData(String key, dynamic data) async {
    final String dataStringify = json.encode(data);
    await _secureStorage.write(key: key, value: dataStringify);
    return true;
  }

  Future<dynamic> getData(String key) async {
    final String data = await _secureStorage.read(key: key);
    return data != null ? (json.decode(data)) : null;
  }

  Future<dynamic> removeData(String key) async {
    await _secureStorage.delete(key: key);
    return true;
  }
}
