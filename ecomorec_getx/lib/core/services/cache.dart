import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/constants.dart';
import '../../model/user.dart';

class Cache {
  Cache._();
  static final Cache instance = Cache._();
  static late SharedPreferences _prefs;
  static Future<SharedPreferences> get prefs async =>
      _prefs = await SharedPreferences.getInstance();

  Future<UserModel> getData() async =>
      UserModel.fromJson(json.decode(_prefs.getString(CACHE_USER_FIELD)!));

  Future<bool> setData(UserModel user) async =>
      await _prefs.setString(CACHE_USER_FIELD, json.encode(user.toJson()));

  Future<bool> deleteData() async => await _prefs.clear();
}
