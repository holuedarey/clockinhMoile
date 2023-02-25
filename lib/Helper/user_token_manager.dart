import 'package:clockingapp/Helper/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserTokenManager {
  static Future<String?> getAccessToken() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: StorageKeys.userToken);
    return token;
  }

  static Future<void> deleteAccessToken() async {
    var storage = const FlutterSecureStorage();
    await storage.delete(key: StorageKeys.userToken);
  }

  static Future<String> insertAccessToken(String token) async {
    var storage = const FlutterSecureStorage();
    await storage.write(key: StorageKeys.userToken, value: token);
    return token;
  }
}


