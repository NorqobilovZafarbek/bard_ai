import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {

  static late final SharedPreferences _sharedPreferences;

  static SharedPreferences get  storage => _sharedPreferences;

  static const _key = "theme";
  static const _chats = "chats";

  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    // await _sharedPreferences.clear();
  }

  static Future<void> saveTheme(String theme) async {
    await _sharedPreferences.setString(_key, theme);
  }

  static String getTheme() => _sharedPreferences.getString(_key) ?? "";

  static Future<void> saveChat(List<Content> chats) async {
   await _sharedPreferences.setStringList(_chats, <String>[]..add(jsonEncode(chats.map((e) => e.toJson()).toList())));
  }

  static List<List<Content>> readChats() {
    final item = _sharedPreferences.getStringList(_chats);
    print('------------------------------------- ReadChat');
    print(item);
    return (item != null && item.isNotEmpty) ? item.map((e) => (jsonDecode(e) as List).map((e) => Content.fromJson(e)).toList()).toList() : [];
  }
}
