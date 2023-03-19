import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'repo/hive/adapter.dart';
import 'repo/port.dart';

/*

1^ INTERFACES
  REPO
    - Store language preference
    - Read language preference
SERVICES

2^ INTERFACES

*/

const boxName = "language_box";

class LanguageProvider extends ChangeNotifier {
  /// HIVE setup
  late Box _box;
  Future _openBox() async {
    _box = await Hive.openBox(boxName);
  }

  /// REPO Setup
  late Port _repo;

  // Locale
  Locale? _locale;
  Locale? get locale => _locale;
  set locale(Locale? v) {
    _locale = v;
    notifyListeners();
  }

  /// Is first time
  bool? _isFirstRun;

  /// Update deps
  LanguageProvider updateDeps({required bool? isFirstRun}) {
    _isFirstRun = isFirstRun;
    return this;
  }

  // void storeLocale() {
  //   _repo.storeLocale(locale: _locale);
  // }

  void readLocale() {
    _repo.readLocale();
  }

  /// Constructor
  /// Default with firstRun flag
  LanguageProvider({bool? isFirstRun}) {
    _isFirstRun = isFirstRun;
    _openBox().then((_) {
      _repo = HiveAdapter(box: _box) as Port;
      if (_isFirstRun == false) {
        // Load language from storage
        readLocale();
        return;
      }
      // Set language to defaults
    });
  }
}
