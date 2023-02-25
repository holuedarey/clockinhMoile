import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/models/base.dart';
import '../Helper/storage_keys.dart';

class LocalStorageUtils<M extends BaseModel> {
  static writeBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool?> readBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static deleteBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static write(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> read(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static saveList<T extends BaseModel>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = json.encode(value.toJson());
    var list = await readList(key) ?? [];

    prefs.setStringList(key, [...list, data]);
  }

  static Future<List<String>?> readList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static saveObject<T extends BaseModel>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = json.encode(value.toJson());
    prefs.setString(key, data);
  }

  static Future<dynamic> readObject<T extends BaseModel>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var prefData = prefs.getString(key);
    if (prefData != null) {
      var data = json.decode(prefData);
      return data;
    }
    return null;
  }

  static Future<dynamic> readListObject<T extends BaseModel>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var prefData = prefs.getStringList(key);
    if (prefData != null) {
      var data = prefData.map((e) => json.decode(e)).toList();
      return data;
    }
    return null;
  }
}

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
