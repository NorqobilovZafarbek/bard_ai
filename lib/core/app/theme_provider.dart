

import 'package:flutter/material.dart';

import '../../domain/services/local_db/app_services.dart';

class ThemeProvider extends ChangeNotifier {

  late ThemeMode themeMode;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  Future<void> toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    await AppServices.saveTheme(themeMode.name);
    notifyListeners();
  }

  ThemeMode mode() {
    String theme = AppServices.getTheme();
    themeMode = switch(theme){
      "light" => ThemeMode.light,
      "dark" => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    return themeMode;
  }
}