/*
Services 
-LoadAppDefaultTheme 
-LoadSystemDefaultTheme
-ThemeMode

Interface/ Dependancy 
HIVE

*/

import 'package:client_app/providers/first_run/repo/port.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../first_run/repo/hive/adapter.dart';

const boxName = "theme_box";

class ThemeProvider extends ChangeNotifier {
  // Define Hive

  //repo general
  late Box _box;

  //repo HIVE
  late Port _repo;

  //first run
  bool? _isFirstRun;

  //when it is the first time
  ThemeProvider updateDeps({required bool? isFirstRun}) {
    _isFirstRun = isFirstRun;

    return this;
  }

  //load system default theme
  void _LoadSystemDefaultThemeMode() {
    _mode = ThemeMode.system;
  }

  //load app default theme
  void _loadDefaultThemeMode() {
    _mode = ThemeMode.light;
  }

  //constructors
  //when first run make default

  ThemeProvider({bool? isfirstrun}) {
    _isFirstRun = isfirstrun;
    _openBox().then((_) {
      _repo = HiveAdapter(box: _box);
      if (_isFirstRun == false) {
        //load theme mode from storage
        _loadDefaultThemeMode();
        return;
      }
      //set theme mode to default
      _LoadSystemDefaultThemeMode();
    });
  }

  //Set theme mode
  ThemeMode? _mode;
  ThemeMode? get mode => _mode;
  set mode(ThemeMode? v) {
    _mode = v;
    notifyListeners();
  }

  Future<void> _openBox() async {
    _box = await Hive.openBox(boxName);
  }
}
