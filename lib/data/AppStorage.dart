import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AppStorageKey {
  JWT,
  LocationSetting,
}

class AppStorage {
  final storage = new FlutterSecureStorage();

  Future<String> get({AppStorageKey key}) async {
    return await storage.read(key: AppStorageKey.JWT.toString());
  }

  Future<void> write({AppStorageKey key, String value}) async {
    return await storage.write(key: AppStorageKey.JWT.toString(), value: value);
  }

  Future<void> delete({AppStorageKey key}) async {
    return await storage.delete(key: AppStorageKey.JWT.toString());
  }
}
