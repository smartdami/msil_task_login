import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CommonSecureStore {
  static const _secureStore = FlutterSecureStorage();
  static const String xAuthToken = 'token';

  static bool hasToken = false;

  static Future<void> setSecureStore(String key, var data) async {
    if (key == xAuthToken) hasToken = true;
    await _secureStore.write(key: key, value: data);
  }

  static Future<String> getSecureStore(String key) async {
    return await _secureStore.read(key: key) ?? "";
  }

  // static Future<void> deleteSecureStore(String key) async {
  //   if (key == xAuthToken) hasToken = false;
  //   await _secureStore.delete(key: key);
  // }
}
